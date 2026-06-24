struct Chain1 {
  a: Int;
}
struct Chain2 {
  prev: Chain1;
}
struct Chain3 {
  prev: Chain2;
}

contract ChainContract {
  chain: Chain3;

  init() {
    self.chain = Chain3{
      prev: Chain2{
        prev: Chain1{
          a: 55
        }
      }
    };
  }
}