struct Point { x: Int; y: Int }

contract TestDeepNestedReturn {
  fun f(): Int {
    if (1 + 1 == 2) {
      { if (2 + 2 == 4) { return 10; } }
    } else {
      { if (3 + 3 == 6) { return 20; } }
    }
    return 30;
  }
}

contract TestComplexConditionalReturn {
  fun f(a: Int): String {
    if (a > 0) { return "positive"; } else if (a == 0) { return "zero"; } else { return "negative"; }
  }
}

contract TestGetterTupleReturn {
  p: Point = Point{ x: 3, y: 4 };
  get fun getPoint(): Point {
    if (self.p.x > self.p.y) { return self.p; } else { return Point{ x: self.p.y, y: self.p.x }; }
  }
}

contract TestRepeatReturn {
  fun f(): Int {
    repeat (3) {
      if (true) { return 100; }
    }
    return 200;
  }
}

contract TestNestedBlockReturn {
  fun f(): Int {
    { { if (false) { return 111; } } }
    { if (true) { return 222; } { } }
    return 333;
  }
}
