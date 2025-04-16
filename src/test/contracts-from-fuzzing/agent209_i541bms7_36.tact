// Optional Bool chain
struct OB3 { b: Bool?; }
struct OB2 { o: OB3?; }
struct OB1 { o: OB2?; }

contract OptBoolChain {
  chain: OB1;

  init() {
    self.chain = OB1{
      o: OB2{
        o: OB3{
          b: true
        }
      }
    };
  }
}