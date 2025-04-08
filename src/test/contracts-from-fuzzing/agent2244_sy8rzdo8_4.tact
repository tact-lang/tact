struct OnlyBools {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
  g: Bool;
  h: Bool;
  i: Bool;
  j: Bool;
}

contract ManyBools {
  flags: OnlyBools;

  init() {
    self.flags = OnlyBools{
      a:true, b:false, c:true, d:false, e:true,
      f:false, g:true, h:false, i:true, j:false
    };
  }
}