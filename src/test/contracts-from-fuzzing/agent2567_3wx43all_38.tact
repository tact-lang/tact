struct SerializeExtremes {
  a:Int as int1;
  b:Int as int257;
  c:Int as uint1;
  d:Int as uint256;
}

contract ExtremeWidths {
  s: SerializeExtremes;
  init(){
    self.s=SerializeExtremes{a:0,b:0,c:0,d:0};
  }
}