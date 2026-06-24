struct Chain5 {
  v: Chain4;
}
struct Chain4 {
  v: Chain3;
}
struct Chain3 {
  v: Chain2;
}
struct Chain2 {
  v: Chain1;
}
struct Chain1 {
  v: Int;
}

contract DeepChain {
  f: Chain5;

  init() {
    self.f = Chain5 { v: Chain4 { v: Chain3 { v: Chain2 { v: Chain1{v: 42} } } } };
  }
}