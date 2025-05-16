struct BaseS {
  val1: Int?;
}

struct Wrapper {
  base: BaseS;
}

contract WrapOpt {
  field: Wrapper;
  init() {
    self.field = Wrapper{
      base: BaseS{
        val1: null
      }
    };
  }
}