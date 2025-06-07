struct A {
  x: Int;
  y: Bool?;
}

contract Test {
  arr1: A;
  arr2: A?;

  init() {
    self.arr1 = A{ x:1, y:null };
    self.arr2 = A{ x:2, y:true };
  }
}