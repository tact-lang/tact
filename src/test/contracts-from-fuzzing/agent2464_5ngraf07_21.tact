struct Chain1 {
  x: Chain2;
}

struct Chain2 {
  y: Chain3;
}

struct Chain3 {
  z: Chain4;
}

struct Chain4 {
  val: Int;
}

contract DeepChain {
    c: Chain1;

    init() {
        self.c = Chain1{
            x: Chain2{
                y: Chain3{
                    z: Chain4{
                        val: 77
                    }
                }
            }
        };
    }
}
