struct Inner {
  a: Int;
  b: Bool;
}

contract NestTester {
    data: Inner;

    init() {
        self.data = Inner{ a: 7, b: true };
    }
}