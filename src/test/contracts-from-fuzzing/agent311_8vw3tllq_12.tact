struct Mix {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract MixedTypes {
  data: Mix;

  init() {
    self.data = Mix{
      a:1,b:true,c:"hi",d:null,e:false,f:null
    };
  }
}