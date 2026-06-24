// Optional nested struct default to null implicitly
struct Nest {
   a: Int?;
   b: Bool?;
}

struct WrapOpt {
   inner: Nest?;
}

contract ImplicitOptNull {
  wrap: WrapOpt;
  init() {
    self.wrap = WrapOpt { inner: null };
  }
}