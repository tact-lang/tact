// optional struct fields but struct is stored persistently
struct InnerOpt {
  a: Int?;
  b: Bool?;
}

contract StructWithInnerOptionals {
  innerOpt: InnerOpt;

  init() {
    self.innerOpt = InnerOpt{
      a: null,
      b: null
    };
  }
}