extends mutates fun inc(self: Int) {
    self += 1;
}

contract IncTest {
  receive() {
    let x = 10;
    x.inc();
    dump(x); // Expected output: 11
  }
}
