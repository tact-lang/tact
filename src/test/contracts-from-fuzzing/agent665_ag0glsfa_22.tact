struct Chain1 {
  a: Int;
}

struct Chain2 {
  c1: Chain1;
}

struct Chain3 {
  c2: Chain2;
}

contract DeepChainContract {
    field: Chain3 = Chain3{c2: Chain2{c1: Chain1{a:5}}};

    init() {
        self.field = self.field;
    }

    receive() {
        let _ = self.field;
    }
}