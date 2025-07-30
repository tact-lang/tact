struct Naive {
  x: Int;
}

contract LargeList {
  f1: Naive; f2: Naive; f3: Naive; f4: Naive; 
  f5: Naive; f6: Naive; f7: Naive; f8: Naive; f9: Naive; f10: Naive;

  init() {
    self.f1 = Naive{x:1}; self.f2=Naive{x:2}; self.f3=Naive{x:3}; 
    self.f4=Naive{x:4}; self.f5=Naive{x:5}; self.f6=Naive{x:6}; 
    self.f7=Naive{x:7}; self.f8=Naive{x:8}; self.f9=Naive{x:9}; self.f10=Naive{x:10};
  }
}