using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace GameDice
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        Random _random = new Random();

        public Window1()
        {
            InitializeComponent();
        }

        private void btnRoll_Click(object sender, RoutedEventArgs e)
        {
            int dice = 0;
            int sides = 0;
            Int32.TryParse(txtNumDice.Text, out dice);
            Int32.TryParse(txtNumSides.Text, out sides);
            if (dice > 0 && sides > 0)
            {
                int total = 0;
                txtResult.Text = String.Empty;
                for (int i = 0; i < dice; i++)
                {
                    int val = _random.Next(1, sides+1);
                    total += val;
                    if (i > 0)
                        txtResult.Text += ", ";
                    txtResult.Text += val.ToString(); 
                }
                txtTotal.Text = total.ToString();
            }
        }

        private void btnAbout_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Lambda Dice 1.01 is Copyright (c) 2010-2020 Lambda Centauri\n\nLambda Dice is freeware and may be distributed freely.\n\nWritten by Jason Champion.\n\nhttps://lambdacentauri.com");
        }
    }
}
