struct SerializeBoolTest {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
  g: Bool;
  h: Bool;
}

contract BoolPackTest {
  packed: SerializeBoolTest;

  init() {
    self.packed = SerializeBoolTest{
      a:true,b:false,c:true,d:true,e:false,f:false,g:true,h:false
    };
  }
}