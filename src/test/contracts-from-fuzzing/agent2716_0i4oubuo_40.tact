struct DeepOptChain1 { a: Int?; }
struct DeepOptChain2 { prev: DeepOptChain1?; }
struct DeepOptChain3 { prev: DeepOptChain2?; }
struct DeepOptChain4 { prev: DeepOptChain3?; }

contract DeepOptNest {
  data: DeepOptChain4;
  init() {
    self.data = DeepOptChain4{prev:null};
  }
}