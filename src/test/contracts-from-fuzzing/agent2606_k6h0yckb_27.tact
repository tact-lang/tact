struct Alias {
  int8v: Int as int8;
  int64v: Int as int64;
  uint4v: Int as uint4;
  coinv: Int as coins;
}

contract AliasStruct {
  v: Alias;

  init() {
    self.v = Alias{ int8v: -3, int64v: 10, uint4v: 7, coinv: ton("1") };
  }
}