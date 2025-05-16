struct DeepNestedMany {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
}

struct OuterDeepMany {
  n1: DeepNestedMany;
  n2: DeepNestedMany;
  n3: DeepNestedMany;
}

contract HasDeepNestMany {
  val: OuterDeepMany;

  init() {
    self.val = OuterDeepMany{
      n1: DeepNestedMany{a:1,b:2,c:3,d:4,e:5},
      n2: DeepNestedMany{a:6,b:7,c:8,d:9,e:10},
      n3: DeepNestedMany{a:11,b:12,c:13,d:14,e:15}
    };
  }
}