struct Inner1 {
  x: Int;
}

struct Inner2 {
  s: Inner1;
}

struct Inner3 {
  t: Inner2;
}

contract MultiNest {
  z: Inner3;

  init() {
    self.z = Inner3 {
      t: Inner2 {
        s: Inner1 {
          x:99
        }
      }
    };
  }
}