using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pz18.Interfaces
{
    public interface IRequest
    {
        int RequestId { get; }
        DateTime StartDate { get; set; }
        string HomeTechType { get; set; }
        string HomeTechModel { get; set; }
        string ProblemDescription { get; set; }
        string RequestStatus { get; set; }
        DateTime? CompletionDate { get; set; }
        string RepairParts { get; set; }
        int? MasterId { get; set; }
        int ClientId { get; set; }

        void UpdateStatus(string newStatus);
        void AssignMaster(int masterId);
    }
}
