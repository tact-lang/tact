struct Inner {
  a: Int;
  b: String?;
}

contract TestContract {
  data: Inner;
  
  init() {
    self.data = Inner{
      a: 10,
      b: "hello"
    };
  }
}