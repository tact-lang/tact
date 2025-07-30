struct BigStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
  e: Bool;
  f: String;
  g: Int;
  h: Bool;
  i: String;
}

contract TestContract {
  many: BigStruct;
  init() {
    self.many = BigStruct{
      a:1, b:true, c:"x",
      d:2, e:false, f:"y",
      g:3, h:true, i:"z"
    };
  }
}