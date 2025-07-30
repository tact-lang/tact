struct WrappedBool {
 b: Bool;
}

struct Wrapper {
 inner: WrappedBool;
}

contract BoolStructWrap {
  storage: Wrapper;

  init() {
    self.storage = Wrapper{inner: WrappedBool{b:true}};
  }
}