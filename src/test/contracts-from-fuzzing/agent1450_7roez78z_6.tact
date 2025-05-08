struct OptionalNested {
  s: SubStruct?;
}

struct SubStruct {
  val: Int;
}

contract OptionalStructFieldTest {
  value: OptionalNested;

  init() {
    self.value = OptionalNested{
      s: null,
    };
  }
}