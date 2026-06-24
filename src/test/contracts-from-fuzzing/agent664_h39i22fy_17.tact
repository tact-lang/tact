// optional with default value chain

struct Chain {
  x: Int?;
  y: Bool?;
}

contract Test {
  data: Chain;

  init() {
    self.data = Chain{
      x: null,
      y: null,
    };
  }
}