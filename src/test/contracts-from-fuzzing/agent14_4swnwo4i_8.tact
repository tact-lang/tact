//// Test Message invalid usage: using a negative value for a uint8 field

message TestMsgNeg { val: Int as uint8; }

contract TestMsgNegInvalid {
  fun run() {
    // This should trigger a compile error since -1 is not a valid value for uint8 (0..255)
    let m = TestMsgNeg{ val: -1 };
    dump(m.val);
  }
  receive() { self.run(); }
}
