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
    /// Логика взаимодействия для PageGenre.xaml
    /// </summary>
    public partial class PageGenre : Page
    {
        public PageGenre()
        {
            InitializeComponent();
            updateDG();
        }

        private void buttonAdd_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxTitle.Text))
            {
                MessageBox.Show("Заполните все поля!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                RockDBEntities.GetContext().AddGenre(textBoxTitle.Text);

                MessageBox.Show("Элемент добавлен", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }

        private void buttonDelete_Click(object sender, RoutedEventArgs e)
        {
            if (dataGridGenre.SelectedItems.Count != 1)
            {
                MessageBox.Show("Выберите один элемент для удаления", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                dynamic item = dataGridGenre.SelectedItem;

                int idGenre = item.Id;

                RockDBEntities.GetContext().DeleteGenre(idGenre);

                MessageBox.Show("Элемент удален", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }

        private void updateDG()
        {
            var query =
                from genre in RockDBEntities.GetContext().Genre
                orderby genre.Id
                select new
                {
                    genre.Id,
                    genre.Title
                };

            dataGridGenre.ItemsSource = query.ToList();
        }

        private void dataGridGenre_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            updateDG();
        }

        private void buttonToArtist_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new PageArtist());
        }

        private void buttonToAlbum_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new PageAlbums());
        }

        private void buttonToTrack_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new PageTracks());
        }
    }
}
