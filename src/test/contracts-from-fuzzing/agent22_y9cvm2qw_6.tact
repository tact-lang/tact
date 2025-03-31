struct Status {
    value: Int;
    flag: Bool;
}

contract TestReturn {

  fun absolute(x: Int): Int {
    if (x >= 0) { return x; }
    return -x;
  }

  get fun status(): Status {
    let v = self.absolute(-42);
    if (v == 42) { return Status { value: v, flag: true }; }
    else { return Status { value: v, flag: false }; }
  }

  receive () {
    return;
  }

  fun nestedReturn(x: Int): Int {
    { if (x > 10) { return x; } }
    return 0;
  }

  fun conditionalReturn(x: Int): Int {
      if (x > 0) { return x; }
      else { return -x; }
  }

  fun doNothing() {
      return;
  }

}
