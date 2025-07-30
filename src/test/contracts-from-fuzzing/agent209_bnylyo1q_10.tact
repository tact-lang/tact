struct Inner {
  z: Bool;
}

struct Wrapper {
  i1: Inner;
  i2: Inner;
  i3: Inner;
}

contract TestContract {
  wrap: Wrapper;

  init() {
    self.wrap = Wrapper{
      i1: Inner{z:true},
      i2: Inner{z:false},
      i3: Inner{z:true}
    };
  }
}