struct DeepOptional {
  a: Int?;
  b: String?;
  c: NestedOptional?;
}

struct NestedOptional {
  n: Int?;
}

contract DeepOptTest {
  val: DeepOptional;

  init() {
    self.val = DeepOptional{
      a:null,
      b: null,
      c: NestedOptional{n:null}
    };
  }
}