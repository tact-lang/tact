struct Chain1 { inner: Chain2 }
struct Chain2 { inner: Chain3 }
struct Chain3 { inner: Chain4 }
struct Chain4 { num: Int? }

contract DeepOptionChain {
  f: Chain1;

  init() {
    self.f = Chain1{
      inner:Chain2{
        inner:Chain3{
          inner:Chain4{
            num:null
          }
        }
      }
    };
  }
}