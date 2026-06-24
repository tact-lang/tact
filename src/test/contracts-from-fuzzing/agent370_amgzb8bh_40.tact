struct N1 {
 val: Int;
}
struct N2 {
 val: Int;
}
struct N3 {
 val: Int;
}

contract Repeated {
 a: N1;
 b: N2;
 c: N3;
 init() {
  self.a = N1{val:1};
  self.b = N2{val:2};
  self.c = N3{val:3};
 }
}