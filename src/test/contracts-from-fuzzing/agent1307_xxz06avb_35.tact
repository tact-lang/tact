message(1) M1 {}
message(2) M2 {}

struct WrapMsgs {
  a: M1;
  b: M2;
}

contract MultiMsgsStore {
  m: WrapMsgs = WrapMsgs{ a: M1{}, b: M2{} };

  init() {
    self.m = WrapMsgs{ a: M1{}, b: M2{} };
  }
}