struct S1 {
  a: Int;
}
struct S2 {
  inner: S1;
}
struct S3 {
  inner: S2;
}
struct S4 {
  inner: S3;
}
struct S5 {
  inner: S4;
}
contract DeepFiveNested {
  s: S5;
  init() {
    self.s = S5{inner:S4{inner:S3{inner:S2{inner:S1{a:5}}}}};
  }
}