// Compose multiple optional nested message structs in chain
message(0x1) A { x: Int? }
message(0x2) B { a: A? }
message(0x3) C { b: B? }

contract OptMsgChain {
  cmsg: C?;
  init() {
    self.cmsg = C{ b: B{ a: null } };
  }
}