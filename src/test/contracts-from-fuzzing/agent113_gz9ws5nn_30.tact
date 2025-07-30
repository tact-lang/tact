struct FieldChain1 {
  next: FieldChain2;
}
struct FieldChain2 {
  next: FieldChain3;
}
struct FieldChain3 {
  next: FieldChain4;
}
struct FieldChain4 {
  next: FieldChain5;
}
struct FieldChain5 {
  leaf: Int?;
}

contract ChainTest {
  root: FieldChain1;

  init() {
    self.root = FieldChain1{
      next: FieldChain2{
        next: FieldChain3{
          next: FieldChain4{
            next: FieldChain5{ leaf: null }
          }
        }
      }
    };
  }
}