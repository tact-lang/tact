struct Inner {
    val: Int;
}
struct Middle {
    inner: Inner;
}
struct Outer {
    middle: Middle;
}
struct Envelope {
    content: Outer;
}

contract MultiEnvelope {
  stored: Envelope;

  init() {
    self.stored = Envelope{
      content: Outer{
        middle: Middle{
          inner: Inner{ val: 77 }
        }
      }
    };
  }
}