struct Inner1 {
 a: Int;
}
struct Inner2 {
 a: Int;
}

struct Outer {
 i1: Inner1;
 i2: Inner2;
}

contract DifferentInnerStructs {
   field: Outer;
   init() {
     self.field = Outer{
       i1: Inner1{a:1},
       i2: Inner2{a:2}
     };
   }
}
