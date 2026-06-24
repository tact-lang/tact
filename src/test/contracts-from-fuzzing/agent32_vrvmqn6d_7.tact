struct S {
  a: Int;
}

contract Test {
  arr1: S;
  arr2: S;
  arr3: S;
  arr4: S;

  init() {
    self.arr1 = S{a:1};
    self.arr2 = S{a:2};
    self.arr3 = S{a:3};
    self.arr4 = S{a:4};
  }
}