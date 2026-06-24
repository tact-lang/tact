message S { val: Int; }

message M { s: S; }

contract Test {
  receive(msg: M) {
    msg.s = S{ val: 999 };
    msg.s.val = 123;
  }
}