struct NestedMany {
  a: NestedInner;
  b: NestedInner;
  c: NestedInner;
}

struct NestedInner {
  i: Int;
  s: String;
  o: Int?;
}

contract MultiNested {
  data: NestedMany;
  init() {
    self.data = NestedMany{
      a:NestedInner{i:1,s:"a",o:null},
      b:NestedInner{i:2,s:"b",o:null},
      c:NestedInner{i:3,s:"c",o:null}
    };
  }
}