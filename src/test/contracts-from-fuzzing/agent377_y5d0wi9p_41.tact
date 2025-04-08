struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }
struct S4 { d: Int; }
struct S5 { e: Int; }

struct Container {
 s1: S1;
 s2: S2;
 s3: S3;
 s4: S4;
 s5: S5;
}

contract MultiContainer {
 c: Container = Container{
   s1: S1{a:1},
   s2: S2{b:2},
   s3: S3{c:3},
   s4: S4{d:4},
   s5: S5{e:5}
 };
}