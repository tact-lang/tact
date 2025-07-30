struct SRec1 {
  s: SRec2?;
}

struct SRec2 {
  s: SRec3?;
}

struct SRec3 {
  val: Int;
}

contract IndirectRecursionTest {
  state: SRec1;

  init() {
    self.state = SRec1{ s: null };
  }

  receive() {
    if (self.state.s != null) {
      let _ = self.state.s!!.s;
    }
  }
}
