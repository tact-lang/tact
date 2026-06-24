struct A { num: Int }

contract Mult {
  arr1: A;
  arr2: A;
  arr3: A;
  arr4: A;
  arr5: A;
  arr6: A;

  init() {
    self.arr1 = A{num:1};
    self.arr2 = A{num:2};
    self.arr3 = A{num:3};
    self.arr4 = A{num:4};
    self.arr5 = A{num:5};
    self.arr6 = A{num:6};
  }
}