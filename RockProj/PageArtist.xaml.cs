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
    /// Логика взаимодействия для PageArtist.xaml
    /// </summary>
    public partial class PageArtist : Page
    {
        public PageArtist()
        {
            InitializeComponent();

            updateDG();
        }

        private void dataGridArtist_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
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
                RockDBEntities.GetContext().AddArtist(textBoxTitle.Text);

                MessageBox.Show("Элемент добавлен", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }

        private void buttonDelete_Click(object sender, RoutedEventArgs e)
        {
            if (dataGridArtist.SelectedItems.Count != 1)
            {
                MessageBox.Show("Выберите один элемент для удаления", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                dynamic item = dataGridArtist.SelectedItem;

                int idArtist = item.Id;

                RockDBEntities.GetContext().DeleteArtist(idArtist);

                MessageBox.Show("Элемент удален", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                updateDG();
            }
        }

        private void updateDG()
        {
            var query =
                from artist in RockDBEntities.GetContext().Artist
                orderby artist.Id
                select new
                {
                    artist.Id,
                    artist.Title
                };

            dataGridArtist.ItemsSource = query.ToList();
        }
    }
}
