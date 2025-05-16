struct SerializeTest {
  a: Int as uint8;
  b: Int as int16;
  c: Int as coins;
  d: Bool;
  e: String;
}

contract SerTest {
  data: SerializeTest = SerializeTest{ a:7, b:-100, c:1000000000, d:true, e:"hello" };
  init() {
    self.data = SerializeTest{ a:8, b:-101, c:2000000000, d:false, e:"world" };
  }
  receive() {}
}