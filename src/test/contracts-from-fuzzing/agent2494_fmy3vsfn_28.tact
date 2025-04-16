struct X { a: Int; }
struct Y { x: X; }
struct Z { y: Y; }

contract C {
  store: Z;

  init() {
    self.store = Z{ y: Y{ x: X { a: -99 }}};
  } 
}