struct Chain4 {
  a: Int;
}

struct Chain3 {
  nested: Chain4;
}

struct Chain2 {
  nested: Chain3;
}

struct Chain1 {
  nested: Chain2;
}

contract ChainTest {
  field: Chain1;

  init() {
    self.field = Chain1{
      nested: Chain2{
        nested: Chain3{
          nested: Chain4{a: 999}
        }
      }
    };
  }
}