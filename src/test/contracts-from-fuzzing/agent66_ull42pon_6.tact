struct SubStruct {
  x: Int;
  y: String;
  z: Bool?;
}

contract TestContract {
  a: Int = 0;
  b: String = "";
  c: Bool = false;
  d: Int? = null;
  e: String? = null;
  f: Bool? = null;
  g: SubStruct;

  init() {
    self.g = SubStruct{x: 1, y: "foo", z: null};
  }
}