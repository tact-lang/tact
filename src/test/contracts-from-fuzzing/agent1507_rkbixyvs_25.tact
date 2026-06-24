struct LongChain1 { n: Int; }
struct LongChain2 { x: LongChain1; }
struct LongChain3 { x: LongChain2; }
struct LongChain4 { x: LongChain3; }
struct LongChain5 { x: LongChain4; }
struct LongChain6 { x: LongChain5; }

contract ChainDepthTest {
  deep: LongChain6;

  init() {
    self.deep = LongChain6{
      x: LongChain5{
        x: LongChain4{
          x: LongChain3{
            x: LongChain2{
              x: LongChain1{ n:42 }
            }
          }
        }
      }
    };
  }
}
