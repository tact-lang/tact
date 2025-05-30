// Contract with optional struct-in-struct as property
struct LeafTest { v: Int; }
struct MidTest { child: LeafTest?; }

contract OptInField {
  m: MidTest;

  init() {
    self.m = MidTest{
      child: null
    };
  }
}