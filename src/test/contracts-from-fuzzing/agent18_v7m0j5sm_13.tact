struct In1 { val: Int; }
struct In2 { val: In1; }
struct In3 { val: In2; }
struct In4 { val: In3; }

struct Outmost {
  a: In4?;
  b: In4?;
}

contract OptDeepNested {
  val: Outmost;

  init() {
    self.val = Outmost{ a: null, b: null };
  }
}