using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RockProj
{
    /// <summary>
    /// Логика взаимодействия для PageTracks.xaml
    /// </summary>
    public partial class PageTracks : Page
    {
        public PageTracks()
        {
            InitializeComponent();

            updateDG();

            foreach(Album album in RockDBEntities.GetContext().Album.ToList())
            {
                comboBoxAlbum.Items.Add(album.Title);
            }

            comboBoxAlbum.SelectedIndex = 0;

            foreach (Genre genre in RockDBEntities.GetContext().Genre.ToList())
            {
                comboBoxGenre.Items.Add(genre.Title);
            }

            comboBoxGenre.SelectedIndex = 0;
        }

        private void dataGridTrack_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            updateDG();
        }

        private void updateDG()
        {
            var query =
                from track in RockDBEntities.GetContext().Track
                orderby track.Id
                select new
                {
                    track.Id,
                    track.Title,
                    Album = track.Album.Title,
                    Artist = track.Album.Artist.Title,
                    Genre = track.Genre.Title,
                    track.Duration,
                    track.Size,
                    track.Price
                };

            dataGridTrack.ItemsSource = query.ToList();
        }

        private void buttonDelete_Click(object sender, RoutedEventArgs e)
        {
            if (dataGridTrack.SelectedItems.Count != 1)
            {
                MessageBox.Show("Выберите один элемент для удаления", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                dynamic item = dataGridTrack.SelectedItem;

                int idTrack = item.Id;

                RockDBEntities.GetContext().DeleteTrack(idTrack);

                MessageBox.Show("Элемент удален", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }

        private void buttonAdd_Click(object sender, RoutedEventArgs e)
        {
            
            if (string.IsNullOrEmpty(textBoxTitle.Text) || string.IsNullOrEmpty(textBoxDuration.Text) || string.IsNullOrEmpty(textBoxPrice.Text)
                || string.IsNullOrEmpty(textBoxSize.Text))
            {
                MessageBox.Show("Заполните все поля!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (!int.TryParse(textBoxDuration.Text, out int duration) || !decimal.TryParse(textBoxPrice.Text, out decimal price)
                || !int.TryParse(textBoxSize.Text, out int size))
            {
                MessageBox.Show("Проверьте числовые значения!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                int idAlbum = 1;

                foreach (Album album in RockDBEntities.GetContext().Album.ToList())
                {
                    if (album.Title == comboBoxAlbum.SelectedItem.ToString())
                    {
                        idAlbum = album.Id;
                        break;
                    }
                }

                int idGenre = 1;

                foreach (Genre genre in RockDBEntities.GetContext().Genre.ToList())
                {
                    if (genre.Title == comboBoxGenre.SelectedItem.ToString())
                    {
                        idGenre = genre.Id;
                        break;
                    }
                }

                RockDBEntities.GetContext().AddTrack(textBoxTitle.Text, idAlbum, idGenre, duration, size, price);

                MessageBox.Show("Элемент добавлен", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }
    }
}
