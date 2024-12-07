using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using pz18.Interfaces;

namespace pz18.Classes
{
    public class User : INotifyPropertyChanged, IUser
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string propertyName) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        [Key]
        public int UserId { get; private set; }

        [Required]
        public string FIO { get; set; }

        [Required]
        [StringLength(11)]
        public string Phone { get; set; }

        [Required]
        [StringLength(50)]
        public string Login { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        [Required]
        public string Type { get; set; }
    }
}
