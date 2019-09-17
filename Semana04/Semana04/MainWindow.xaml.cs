using System;
using System.Windows;
using Business;

namespace Semana04
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BtnConsultar_Click(object sender, RoutedEventArgs e)
        {
            BPedido bPedido = null;
            try
            {
                 bPedido = new BPedido();
                dgvPedido.ItemsSource =bPedido.GetPedidosEntreFechas(Convert.ToDateTime(txtFechaInicio.Text),
                                                                     Convert.ToDateTime(txtFechaFin.Text));
            }
            catch (Exception )
            {
                MessageBox.Show("Comunicarse con el Administrador");
            }
            finally
            {
                bPedido = null;
            }
            

        }
    }
}
