struct MixNested {
  flatInt: Int;
  nested: InnerStruct;
  maybeInner: InnerStruct?;
}

struct InnerStruct {
  flag: Bool;
  subStr: String;
  number: Int?;
}

contract MixedComplex {
  val: MixNested;

  init() {
    self.val = MixNested{
      flatInt: 123,
      nested: InnerStruct{flag:true, subStr:"", number:null},
      maybeInner: null
    };
  }
}
