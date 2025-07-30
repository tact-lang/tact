struct BaseStruct {
  a: Int;
  b: Bool;
}

struct MiddleStruct {
  base: BaseStruct;
  c: String;
}

struct TopStruct {
  middle: MiddleStruct;
  d: Address;
}

contract LayersDeep {
  val: TopStruct;
  init() {
    self.val = TopStruct{
      middle: MiddleStruct{
        base: BaseStruct{a:1, b:true},
        c: "hi"
      },
      d: myAddress()
    };
  }
}