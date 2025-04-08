struct Chain4 {
  inn: Chain3;
}

struct Chain3 {
  inn: Chain2;
}

struct Chain2 {
  inn: Chain1;
}

struct Chain1 {
  val: Int;
}

contract Deep {
  data: Chain4;

  init() {
    self.data = Chain4{ inn: Chain3{ inn: Chain2{ inn: Chain1{ val: 5 } } } };
  }
}