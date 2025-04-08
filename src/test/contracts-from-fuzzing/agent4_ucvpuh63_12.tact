struct S1 {x:Int;}
struct S2 {x:Int;y:S1;}
struct S3 {x:Int;y:S2;}

contract Test {
 s3:S3;

 init() {
  self.s3 = S3{
   x:1,
   y:S2{
    x:2,
    y:S1{
     x:3
    }
   }
  };
 }
}