// optional nested struct optional field
struct InnerOpt {
  val: Int?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract TestContract {
  st: OuterOpt;

  init() {
    self.st = OuterOpt {
      inner: InnerOpt {
        val: null
      }
    };
  }
}