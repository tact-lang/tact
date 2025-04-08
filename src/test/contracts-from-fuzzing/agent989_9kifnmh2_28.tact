struct MixedTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract MixVariants {
  val: MixedTypes;

  init() {
    self.val = MixedTypes{
      a:1,b:true,c:"x",d:2,e:false,f:"y"
    };
  }
}