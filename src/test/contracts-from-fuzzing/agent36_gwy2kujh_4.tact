struct S { a: Int; }

struct T { s: S; }

contract Test {
  receive() {
    let t: T = T{ s: S{ a: 5 } };
  }
}