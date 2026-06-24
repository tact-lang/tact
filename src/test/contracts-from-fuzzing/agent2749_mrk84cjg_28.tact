struct InnerOpt {
 x: Int?;
}
struct OuterOpt {
 y: InnerOpt?;
}

contract DeepOptionWrap {
  val: OuterOpt?;

  init() {
    self.val = null;
  }
}