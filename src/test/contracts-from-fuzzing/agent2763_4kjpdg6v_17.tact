struct Combo {
  i: Int;
  b: Bool;
  a: Address;
  s: String;
  optInt: Int?;
  optBool: Bool?;
  optAddr: Address?;
  optStr: String?;
}

contract ComboContract {
  val: Combo;

  init() {
    self.val = Combo{
      i:1, b:true, a:myAddress(), s:"s",
      optInt:null, optBool:null, optAddr:null, optStr:null
    };
  }
}