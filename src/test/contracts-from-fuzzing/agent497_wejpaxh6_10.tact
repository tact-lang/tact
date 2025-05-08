struct Chain1 { next: Chain2?; a: Int; }
struct Chain2 { next: Chain3?; b: Int; }
struct Chain3 { next: Chain4?; c: Int; }
struct Chain4 { d: Int; }

contract TestContract {
  chain: Chain1;

  init() {
    self.chain = Chain1{
      a:1, next: Chain2{
        b:2, next: Chain3{
          c:3, next: Chain4{
            d:4
          }
        }
      }
    };
  }
}