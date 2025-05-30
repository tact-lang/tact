struct NestedManyFields {
  a: Int;
  b: Int;
  c: Middle;
}

struct Middle {
  d: Int;
  e: Int;
  f: InnerMost;
}

struct InnerMost {
  g: Int;
  h: Int;
  i: Int;
}

contract Test {
  nested: NestedManyFields;
  init() {
    self.nested = NestedManyFields{
      a:1,b:2,c:Middle{
        d:3,e:4,f:InnerMost{
          g:5,h:6,i:7
        }
      }
    };
  }
}