struct Chain1 {
  val1: Int;
}

struct Chain2 {
  nested: Chain1;
}

struct Chain3 {
  nested: Chain2;
}

struct Chain4 {
  nested: Chain3;
}

contract ChainDeep {
  chain: Chain4;

  init() {
    self.chain = Chain4{
      nested: Chain3{
        nested: Chain2{
          nested: Chain1{
            val1: 77
          }
        }
      }
    };
  }
}
