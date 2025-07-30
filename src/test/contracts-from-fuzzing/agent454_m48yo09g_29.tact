struct ManyFields {
  a: Int; b: Int; c: Int;
  d: Bool; e: Bool; f: Bool;
  g: String; h: String; i: String;
}

contract HugeNested {
  val: ManyFields;
  init() {
    self.val = ManyFields{
      a:1,b:2,c:3,d:true,e:false,f:true,g:"x",h:"y",i:"z"};
  }
}