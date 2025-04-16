struct BoolChain1 { f: Bool }
struct BoolChain2 { f: BoolChain1 }
struct BoolChain3 { f: BoolChain2 }
struct BoolChain4 { f: BoolChain3 }

contract LongBoolChain {
  data: BoolChain4 = BoolChain4 { f: BoolChain3 { f: BoolChain2 { f: BoolChain1 { f: true } } } };
  init() {
    self.data = BoolChain4 { f: BoolChain3 { f: BoolChain2 { f: BoolChain1 { f: false } } } };
  }
  receive() {}
}