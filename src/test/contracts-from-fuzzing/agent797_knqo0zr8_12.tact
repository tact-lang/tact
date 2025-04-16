struct Inner {
  sub: Inner2;
}

struct Inner2 {
  subsub: Inner3;
}

struct Inner3 {
  subsubsub: Inner4;
}

struct Inner4 {
  val: Int;
}

contract FiveLayers {
  nested: Inner;

  init() {
    self.nested = Inner{
      sub: Inner2{
        subsub: Inner3{
          subsubsub: Inner4{
            val: 123
          }
        }
      }
    };
  }
}
