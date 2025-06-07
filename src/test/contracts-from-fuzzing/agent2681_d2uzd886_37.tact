struct DeepS1 { x: Int; }
struct DeepS2 { s1: DeepS1; }
struct DeepS3 { s2: DeepS2; }
struct DeepS4 { s3: DeepS3; }
struct DeepS5 { s4: DeepS4; }

contract DeepChain {
  val: DeepS5;
  init() {
    self.val = DeepS5{s4: DeepS4{s3: DeepS3{s2: DeepS2{s1: DeepS1{x: 1}}}}};
  }
}