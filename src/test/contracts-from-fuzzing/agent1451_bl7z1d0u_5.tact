struct OptNested {
  sub: SubStruct?;
}

struct SubStruct {
  a: Int;
  b: Bool;
}

contract OptionalHolder {
  data: OptNested;

  init() {
    self.data = OptNested{
      sub: SubStruct{a:1, b:true}
    };
  }
}
