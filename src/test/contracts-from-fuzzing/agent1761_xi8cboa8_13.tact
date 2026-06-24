struct LongChain1 { next: LongChain2; }
struct LongChain2 { next: LongChain3; }
struct LongChain3 { next: LongChain4; }
struct LongChain4 { next: LongChain5; }
struct LongChain5 { leaf: Int; }

contract LongChainTest {
  s: LongChain1;

  init() {
    self.s = LongChain1{
      next: LongChain2{
        next: LongChain3{
          next: LongChain4{
            next: LongChain5{ leaf: 42 }
          }
        }
      }
    };
  }
}