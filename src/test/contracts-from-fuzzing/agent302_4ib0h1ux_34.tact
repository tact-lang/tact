struct Mix {
  i: Int;
  b: Bool;
  s: String;
  oi: Int?;
  ob: Bool?;
  os: String?;
}

contract MixedTest {
  v: Mix;

  init() {
    self.v = Mix{
      i:7,
      b:false,
      s:"str",
      oi:null,
      ob:true,
      os:null
    };
  }
}