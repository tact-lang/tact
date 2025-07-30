struct BoolChain1 { a: Bool; }
struct BoolChain2 { b: Bool; c: BoolChain1;}
struct BoolChain3 { d: Bool; e: BoolChain2;}

contract PackedBools {
  f: BoolChain3;

  init() {
    self.f = BoolChain3{
      d:true,
      e: BoolChain2{
        b:false,
        c: BoolChain1{
          a:true
        }
      }
    };
  }
}
