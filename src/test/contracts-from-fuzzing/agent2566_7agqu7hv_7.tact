struct InnerOptional {
  innerVal: Int?;
}

struct Middle {
  val: Int;
  nestedOpt: InnerOptional?;
}

contract DeepOptionals {
  middle: Middle;

  init() {
    self.middle = Middle{
      val: 42,
      nestedOpt: null
    };
  }
}
