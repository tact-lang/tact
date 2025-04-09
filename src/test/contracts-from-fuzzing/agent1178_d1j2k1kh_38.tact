// contract with chained nested optionals in struct
struct X { a: Int?; }
struct Y { b: X?; }
struct Z { c: Y?; }

contract Test {
  data: Z;
  init() {
    self.data = Z{c: null};
  }
}