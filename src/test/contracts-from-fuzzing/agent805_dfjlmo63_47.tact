struct DeepManyFields {
  a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
  a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
}

struct NestedDeepManyA { rec: DeepManyFields; }
struct NestedDeepManyB { rec: DeepManyFields; }

contract WideNestedContract {
  x: NestedDeepManyA;
  y: NestedDeepManyB;

  init() {
    self.x = NestedDeepManyA{ rec: DeepManyFields{ a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10 } };
    self.y = NestedDeepManyB{ rec: DeepManyFields{ a1:11,a2:12,a3:13,a4:14,a5:15,a6:16,a7:17,a8:18,a9:19,a10:20 } };
  }
}
