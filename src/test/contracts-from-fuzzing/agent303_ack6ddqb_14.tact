struct Wrap {
  aa: Int;
  bb: Bool;
  cc: String;
  dd: Address;
  ee: Cell;
  ff: Bool?;
  gg: String?;
}

contract Mixed {
  varWrap: Wrap;
  varInt: Int;
  varBool: Bool;
  varOptStr: String?;

  init() {
    self.varWrap = Wrap{
      aa: 11, bb: false, cc: "hey",
      dd: myAddress(), ee: emptyCell(),
      ff: null, gg: "zzz"
    };
    self.varInt = 5;
    self.varBool = true;
    self.varOptStr = null;
  }
}