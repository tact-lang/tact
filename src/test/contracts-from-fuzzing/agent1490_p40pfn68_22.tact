contract ContractDecimals {
  valTon: Int as coins;
  valInt16: Int as int16;
  valUInt4: Int as uint4;

  init() {
    self.valTon = ton("1");
    self.valInt16 = 123;
    self.valUInt4 = 7;
  }
}