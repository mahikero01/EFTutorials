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
            /*
            var newStudent = new Student();

            newStudent.StudentName = "Rico";


            using(var dbCtx = new EFTutorialsDB()){
                dbCtx.Students.Add(newStudent);

                dbCtx.SaveChanges();
            }

            object rico = new object();
             */

            /*
            using (var context = new SchoolEntities())
            {
                var students = (from s in context.SC_Student
                           where s.StudentName == "Student1"
                           select s).FirstOrDefault<SC_Student>();

                Console.WriteLine(students.StudentName);
               
                Console.Read();
            }
             */

            using (var context = new SchoolEntities())
            {
                var students = context.SC_Student.SqlQuery("select * from sc_student").ToList<SC_Student>();

                foreach (var student in students)
                {
                    Console.WriteLine(student.StudentName);
                }
                
                

                Console.Read();
            }
        }
    }
}
