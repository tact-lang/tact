// Struct contains nested optionals and mix types deeply
struct S2 {
  v1: Int?;
  v2: Bool?;
}

struct S1 {
  nest: S2?;
  val: Int;
  flag: Bool?;
}

contract DeepMixStruct {
  s: S1;

  init() {
    self.s = S1{
      nest:null,
      val: 5,
      flag: null
    };
  }
}
