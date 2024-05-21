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
    /// Логика взаимодействия для PageAlbums.xaml
    /// </summary>
    public partial class PageAlbums : Page
    {
        public PageAlbums()
        {
            InitializeComponent();

            updateDG();

            foreach(Artist artist in RockDBEntities.GetContext().Artist.ToList())
            {
                comboBoxArtist.Items.Add(artist.Title);
            }

            comboBoxArtist.SelectedIndex = 0;
        }

        private void dataGridAlbum_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            updateDG();
        }

        private void updateDG()
        {
            var query =
                from album in RockDBEntities.GetContext().Album
                orderby album.Id
                select new
                {
                    album.Id,
                    album.Title,
                    Artist = album.Artist.Title
                };

            dataGridAlbum.ItemsSource = query.ToList();
        }

        private void buttonAdd_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxTitle.Text))
            {
                MessageBox.Show("Заполните все поля!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                int idArdist = 1;

                foreach(Artist artist in RockDBEntities.GetContext().Artist.ToList())
                {
                    if (artist.Title == comboBoxArtist.SelectedItem.ToString())
                    {
                        idArdist = artist.Id;
                        break;
                    }
                }

                RockDBEntities.GetContext().AddAlbum(textBoxTitle.Text, idArdist);

                MessageBox.Show("Элемент добавлен", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }

        private void buttonDelete_Click(object sender, RoutedEventArgs e)
        {
            if (dataGridAlbum.SelectedItems.Count != 1)
            {
                MessageBox.Show("Выберите один элемент для удаления", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                dynamic item = dataGridAlbum.SelectedItem;

                int idAlbum = item.Id;

                RockDBEntities.GetContext().DeleteAlbum(idAlbum);

                MessageBox.Show("Элемент удален", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }
    }
}
