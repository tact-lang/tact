struct LargeNested {
 a: Int;
 b: Int;
 c: Int;
 d: Int;
 nested: InnerLarge;
}

struct InnerLarge {
 x1: Int;
 x2: Int;
 x3: Int;
 x4: Int;
}

contract TestLarge {
 data: LargeNested;
 init() {
  self.data = LargeNested{
   a: 1,
   b: 2,
   c: 3,
   d: 4,
   nested: InnerLarge{
    x1: 5,
    x2: 6,
    x3: 7,
    x4: 8
   }
  };
 }
}
