struct S { x: Int; }
message M { s: S; }

contract Test {
  receive(msg: M) {
    msg.s = S{ x: 2 };
    msg.s.x = 3;
    msg = M{ s: S{ x: 4 } };
  }
}