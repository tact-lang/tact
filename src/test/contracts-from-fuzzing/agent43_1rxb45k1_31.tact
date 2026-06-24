message M { val: Int; }

contract Test {
  receive(msg: M) {
    msg.val = 100;
    msg = M{val: 200};
  }
}