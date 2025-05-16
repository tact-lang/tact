struct Inner {
  value: Int;
}

contract TestContract {
  arr0: Inner;
  arr1: Inner;
  arr2: Inner;
  arr3: Inner;
  arr4: Inner;
  arr5: Inner;
  arr6: Inner;
  arr7: Inner;
  arr8: Inner;
  arr9: Inner;

  init() {
    let val = Inner{ value: 42 };
    self.arr0 = val;
    self.arr1 = val;
    self.arr2 = val;
    self.arr3 = val;
    self.arr4 = val;
    self.arr5 = val;
    self.arr6 = val;
    self.arr7 = val;
    self.arr8 = val;
    self.arr9 = val;
  }
}
