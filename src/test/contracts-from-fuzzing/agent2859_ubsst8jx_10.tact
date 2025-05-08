struct Inner {
  bigInt: Int as uint256;
  smallInt: Int as uint8;
  signedInt: Int as int16;
  flag: Bool;
  maybeAddr: Address?;
}

contract MixSerialized {
  field: Inner;

  init() {
    self.field = Inner{
      bigInt: 100,
      smallInt: 5,
      signedInt: -3,
      flag: true,
      maybeAddr: null
    };
  }
}