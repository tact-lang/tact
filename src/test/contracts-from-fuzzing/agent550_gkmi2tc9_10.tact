struct NestedManyFields {
  sub1: SubFields;
  sub2: SubFields;
}

struct SubFields {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
}

contract Test {
  nmf: NestedManyFields;
  init() {
    self.nmf = NestedManyFields{
      sub1: SubFields{ a:1, b:2, c:3, d:4, e:5 },
      sub2: SubFields{ a:6, b:7, c:8, d:9, e:10 }
    };
  }
}