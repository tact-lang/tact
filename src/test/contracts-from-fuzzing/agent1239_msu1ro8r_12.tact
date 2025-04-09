struct Chain3 {
  f1: Int;
  f2: String;
  f3: Bool;
}

struct Chain2 {
  next: Chain3;
}

struct Chain1 {
  next: Chain2;
}

contract DeepChain {
  start: Chain1;

  init() {
    self.start = Chain1{
      next: Chain2{
        next: Chain3{
          f1: 5,
          f2: "deep",
          f3: true
        }
      }
    };
  }
}