struct BigStruct {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: Int;
  f: Bool;
  g: Int;
  h: Bool;
}

contract ManyFieldsTest {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      a:1, b:true, c:2, d:false, e:3, f:true, g:4, h:false
    };
  }
}
