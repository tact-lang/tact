struct Chain1 {
  a: Int;
}
struct Chain2 {
  p: Chain1;
}
struct Chain3 {
  p: Chain2;
}
struct Chain4 {
  p: Chain3;
}

contract ChainTest {
    data: Chain4;

    init() {
        self.data = Chain4{
            p: Chain3{
                p: Chain2{
                    p: Chain1{
                        a: -999
                    }
                }
            }
        };
    }
}
