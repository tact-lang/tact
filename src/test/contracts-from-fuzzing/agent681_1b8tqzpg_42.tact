struct S0 {
  a: Int;
}
struct S1 {
  a: Int;
}
struct S2 {
  a: Int;
}

struct Big {
 s0: S0;
 s1: S1;
 s2: S2;
}

contract ManySubstructs {
 bb: Big;

 init() {
   self.bb = Big{
     s0: S0{a:1},
     s1: S1{a:2},
     s2: S2{a:3}
   };
 }
}