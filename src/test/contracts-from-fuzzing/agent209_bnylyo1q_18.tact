struct OptionalInner {
  sub: Inner?;
}

struct Inner {
  z: Int?;
}

contract TestContract {
  data: OptionalInner;

  init() {
    self.data = OptionalInner{
      sub: Inner{z:null}
    };
  }
}