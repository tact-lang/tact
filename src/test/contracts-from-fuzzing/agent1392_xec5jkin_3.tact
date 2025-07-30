struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
  e: Bool;
  f: String;
  g: Int;
  h: Bool;
  i: String;
  j: Int;
}

contract TestManyFields {
  mf: ManyFields;

  init() {
    self.mf = ManyFields{
      a:1, b:true, c:"one", d:2, e:false, f:"two", g:3, h:true, i:"three", j:4
    };
  }
}