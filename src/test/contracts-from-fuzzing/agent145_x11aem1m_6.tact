struct OptDepth3 {
  val: Int?;
  leaf: Int?;
}

struct OptDepth2 {
  inner2: OptDepth3?;
}

struct OptDepth1 {
  inner1: OptDepth2?;
}

contract OptDeep {
  root: OptDepth1;

  init() {
    self.root = OptDepth1{
      inner1: OptDepth2{
        inner2: OptDepth3{ val: null, leaf: 777 }
      }
    };
  }
}