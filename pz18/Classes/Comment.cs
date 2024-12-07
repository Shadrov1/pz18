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
    public class Comment : INotifyPropertyChanged, IComment
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string propertyName) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        [Key]
        public int CommentId { get; private set; }

        [Required]
        public string Message { get; set; }

        [Required]
        public int MasterId { get; set; }

        [Required]
        public int RequestId { get; set; }
    }
}
