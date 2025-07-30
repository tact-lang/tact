struct A {
  val: Int?;
}

struct B {
  val: Int?;
}

contract TestContract {
  field1: A;
  field2: Int;
  field3: B;
  field4: Int?;

  init() {
    self.field1 = A{ val: 12 };
    self.field2 = 99;
    self.field3 = B{ val: null };
    self.field4 = null;
  }
}