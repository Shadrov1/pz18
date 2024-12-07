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
    public class Request : INotifyPropertyChanged, IRequest
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string propertyName) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        [Key]
        public int RequestId { get; private set; }

        [Required]
        public DateTime StartDate { get; set; }

        [Required]
        public string HomeTechType { get; set; }

        [Required]
        public string HomeTechModel { get; set; }

        [Required]
        public string ProblemDescription { get; set; }

        [Required]
        public string RequestStatus { get; set; }

        public DateTime? CompletionDate { get; set; }
        public string RepairParts { get; set; }
        public int? MasterId { get; set; }
        public int ClientId { get; set; }

        public void UpdateStatus(string newStatus)
        {
            if (!string.IsNullOrWhiteSpace(newStatus))
            {
                RequestStatus = newStatus;
                OnPropertyChanged(nameof(RequestStatus));
            }
        }

        public void AssignMaster(int masterId)
        {
            MasterId = masterId;
            OnPropertyChanged(nameof(MasterId));
        }
    }

}
