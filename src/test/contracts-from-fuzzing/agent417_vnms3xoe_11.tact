struct Chain1 { f1: Int; }
struct Chain2 { f2: Chain1; }
struct Chain3 { f3: Chain2; }
struct Chain4 { f4: Chain3; }
struct Chain5 { f5: Chain4; }
struct Chain6 { f6: Chain5; }
struct Chain7 { f7: Chain6; }

contract DeepChain {
 state: Chain7;
 init() {
    self.state = Chain7{
      f7: Chain6{
        f6: Chain5{
          f5: Chain4{
            f4: Chain3{
              f3: Chain2{
                f2: Chain1{
                  f1: 42
                }}}}}}};
 }
}