message((crc32("Tact") + 42) & 0xFFFF_FFFF) MsgExpr {
  n: Int;
}

contract HasExprMsg {
  m: MsgExpr;

  init() {
    self.m = MsgExpr{ n: 5 };
  }
}