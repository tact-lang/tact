struct LongInner {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
  e: Bool;
  f: String;
  g: Int;
  h: Bool;
}

contract NestedLongInner {
  field: LongInner;

  init() {
    self.field = LongInner{a:1,b:true,c:"c",d:2,e:false,f:"f",g:7,h:true};
  }
}