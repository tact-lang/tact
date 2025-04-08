struct TestS { foo: Int }

message(1010) M1 { bar: Int }

contract MixedStructMsg {
  s: TestS;
  m: M1;

  init() {
    self.s = TestS { foo: 10 };
    self.m = M1 { bar: 20 };
  }
}