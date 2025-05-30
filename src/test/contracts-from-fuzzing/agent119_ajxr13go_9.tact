struct Large {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
  f: Int;
  g: Int;
  h: Int;
}

struct Holder {
  inner1: Large;
  inner2: Large;
  inner3: Large;
}

contract LargeNested {
  store: Holder;

  init() {
    self.store = Holder{
      inner1: Large{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8},
      inner2: Large{a:9,b:10,c:11,d:12,e:13,f:14,g:15,h:16},
      inner3: Large{a:17,b:18,c:19,d:20,e:21,f:22,g:23,h:24}
    };
  }
}