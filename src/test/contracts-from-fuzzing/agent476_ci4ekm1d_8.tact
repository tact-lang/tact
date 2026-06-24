struct First {
  a: Int;
}

struct Second {
  b: Int;
}

struct Third {
  c: Int;
}

struct Fourth {
  d: Int;
}

struct Fifth {
  e: Int;
}

contract NestedFive {
  val: First;
  val2: Second;
  val3: Third;
  val4: Fourth;
  val5: Fifth;

  init() {
    self.val = First{a:1};
    self.val2 = Second{b:2};
    self.val3 = Third{c:3};
    self.val4 = Fourth{d:4};
    self.val5 = Fifth{e:5};
  }

  receive() {
    let s = self.val.a + self.val2.b + self.val3.c + self.val4.d + self.val5.e;
  }
}