struct Strc {
  a: Int;
}

contract TestContract {
  st1: Strc = Strc{ a: 1 };

  init() {
    self.st1 = Strc{ a: 2 };
  }
}