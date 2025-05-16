struct OptChain1 {
  next: OptChain2?;
}

struct OptChain2 {
  next: OptChain3?;
}

struct OptChain3 {
  next: OptChain4?;
}

struct OptChain4 {
  value: Int?;
}

contract TestContract {
  c: OptChain1;

  init() {
    self.c = OptChain1{
      next: null
    };
  }
}