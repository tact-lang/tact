struct StructOne {
  x: Int;
  y: Bool;
}

struct StructTwo {
  a: Int;
  b: Bool;
}

struct MainStruct {
  s1: StructOne;
  s2: StructTwo;
  optS1: StructOne?;
  optS2: StructTwo?;
}

contract MultiStructs {
  val: MainStruct?;

  init() {
    self.val = null;
  }
}
