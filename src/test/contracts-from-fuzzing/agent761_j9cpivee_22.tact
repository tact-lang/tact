struct A { x: Int }
struct B { y: Int }
struct BigContainer {
  inner1: A;
  inner2: B;
  intVal: Int;
  boolVal: Bool;
  strVal: String;
}
contract NestedMultiType {
  complex: BigContainer;

  init() {
    self.complex = BigContainer{
      inner1: A{ x: 1 },
      inner2: B{ y: 2 },
      intVal: 3,
      boolVal: true,
      strVal: "hi",
    };
  }
}