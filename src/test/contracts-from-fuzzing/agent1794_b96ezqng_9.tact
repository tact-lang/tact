struct S1{
 z: Int;
}
struct S2{
 s1: S1;
 z: Int;
}
struct S3{
 s2: S2;
 z: Int;
}
struct S4{
 s3: S3;
 z: Int;
}
contract FlatDeep {
 x: S4;
 init() {
   self.x = S4 {
     s3: S3 {
       s2: S2 {
         s1: S1 {
           z: 1
         },
         z: 2
       },
       z: 3
     },
     z: 4
   };
 }
}
