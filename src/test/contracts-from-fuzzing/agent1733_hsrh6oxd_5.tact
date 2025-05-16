struct S1 { f1: Int; }
struct S2 { f2: Int; }
struct S3 { f3: Int; }
struct S4 { f4: Int; }
struct S5 { f5: Int; }
struct S6 { f6: Int; }
struct S7 { f7: Int; }

struct Container {
 s1: S1;
 s2: S2;
 s3: S3;
 s4: S4;
 s5: S5;
 s6: S6;
 s7: S7;
}

contract TestContract {
 c: Container;
 init() {
   self.c = Container{
    s1: S1{f1:1},
    s2: S2{f2:2},
    s3: S3{f3:3},
    s4: S4{f4:4},
    s5: S5{f5:5},
    s6: S6{f6:6},
    s7: S7{f7:7}
   };
 }
}