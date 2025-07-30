struct OptionalNested {
  s: SubStruct?;
}

struct SubStruct {
  x: Int;
  y: Int;
}

contract OptionalNestedTest {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      s: SubStruct{x:5,y:10}
    };
  }
}