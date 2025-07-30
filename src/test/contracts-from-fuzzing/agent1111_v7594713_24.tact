struct Pair {
 a: Int;
 b: Int;
}

contract LargeList {
  p1: Pair;
  p2: Pair;
  p3: Pair;
  p4: Pair;
  p5: Pair;
  init() {
   self.p1=Pair{a:1,b:2};
   self.p2=Pair{a:3,b:4};
   self.p3=Pair{a:5,b:6};
   self.p4=Pair{a:7,b:8};
   self.p5=Pair{a:9,b:10};
  }
}