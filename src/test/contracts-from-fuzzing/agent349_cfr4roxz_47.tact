// Compose optional nested message struct type with optional inner fields
message(0x90) M1 { x: Int? }
message(0x91) M2 { m: M1? }

contract OptNestedMsg {
  msg: M2?;
  init() {
    self.msg = M2{ m: null };
  }
}