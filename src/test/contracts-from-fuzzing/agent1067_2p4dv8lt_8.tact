struct Deeply1 { a: Int }
struct Deeply2 { b: Deeply1 }
struct Deeply3 { c: Deeply2 }
struct Deeply4 { d: Deeply3 }
struct Deeply5 { e: Deeply4 }

contract CrazyDeep {
  s: Deeply5;

  init() {
    self.s = Deeply5 { e: Deeply4 { d: Deeply3 { c: Deeply2 { b: Deeply1 { a: 7 } } } } };
  }
}