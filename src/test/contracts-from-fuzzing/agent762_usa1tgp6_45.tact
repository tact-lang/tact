struct DeepMany {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
  f: Int;
  g: Int;
}

contract MultiDeepMany {
  one: DeepMany;
  two: DeepMany;

  init() {
    self.one = DeepMany{a:1,b:2,c:3,d:4,e:5,f:6,g:7};
    self.two = DeepMany{a:7,b:6,c:5,d:4,e:3,f:2,g:1};
  }
}