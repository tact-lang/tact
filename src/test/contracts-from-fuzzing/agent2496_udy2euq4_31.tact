struct StructA {
  num: Int;
  s: String;
}

struct StructB {
  flag: Bool;
  sa: StructA?;
}

contract OptionalStructInStruct {
  val: StructB;

  init() {
    self.val = StructB{
      flag: true,
      sa: null
    };
  }
}
