using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFTutorials
{
    class Program
    {
        static void Main(string[] args)
        {

            var newStudent = new Student();

            newStudent.StudentName = "Rico";


            using(var dbCtx = new EFTutorialsDB()){
                dbCtx.Students.Add(newStudent);

                dbCtx.SaveChanges();
            }

            object rico = new object();
        }
    }
}
