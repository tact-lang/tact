// A very deep nested struct chain
struct N1 {
  x: Int = 1;
}
struct N2 {
  n: N1;
}
struct N3 {
  n: N2;
}
struct N4 {
  n: N3;
}
struct N5 {
  n: N4;
}
struct N6 {
  n: N5;
}
struct N7 {
  n: N6;
}
struct N8 {
  n: N7;
}
struct N9 {
  n: N8;
}
struct N10 {
  n: N9;
}

contract VeryDeep {
  chain: N10;

  init() {
    self.chain = N10{n:N9{n:N8{n:N7{n:N6{n:N5{n:N4{n:N3{n:N2{n:N1{x:999}}}}}}}}}};
  }
}
