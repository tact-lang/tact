struct EmbedStruct {
  i: Int;
  b: Bool;
}

contract StructArrayLike {
  s1: EmbedStruct;
  s2: EmbedStruct;
  s3: EmbedStruct;

  init() {
    self.s1 = EmbedStruct{i:1,b:true};
    self.s2 = EmbedStruct{i:2,b:false};
    self.s3 = EmbedStruct{i:3,b:true};
  }
}