struct Mixed {
  a: Int;
  b: String;
  c: Int?;
  d: String?;
  e: Bool?;
}

contract MixTest {
  val: Mixed;
  init() {
    self.val = Mixed{a:1,b:"x",c:null,d:null,e:true};
  }
}