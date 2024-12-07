using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pz18.Interfaces
{
    public interface IComment
    {
        int CommentId { get; }
        string Message { get; set; }
        int MasterId { get; set; }
        int RequestId { get; set; }
    }
}
