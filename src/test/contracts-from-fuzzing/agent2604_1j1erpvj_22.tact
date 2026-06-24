struct WideNesting {
  a: Int;
  b: Int;
  c: Int;
  d: InnerWide;
}

struct InnerWide {
  e: Int;
  f: Int;
  g: Int;
  h: Int;
  i: Int;
  j: Int;
}

contract WideNestedTest {
  v: WideNesting;

  init() {
    self.v = WideNesting{
      a:1,b:2,c:3,d:InnerWide{
        e:4,f:5,g:6,h:7,i:8,j:9
      }
    };
  }
}