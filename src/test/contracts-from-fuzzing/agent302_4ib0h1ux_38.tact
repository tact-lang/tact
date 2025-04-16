struct Breaker {
  num: Int as uint32;
  optNum: Int?;
  optBool: Bool?;
}

contract StorageBreaker {
  state: Breaker;

  init() {
    self.state = Breaker{
      num: 42,
      optNum: null,
      optBool: true
    };
  }
}