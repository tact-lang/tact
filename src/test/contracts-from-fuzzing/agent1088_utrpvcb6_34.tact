struct Mixed {
  n: Int;
  flag: Bool;
  addr: Address;
  txt: String;
  optInt: Int?;
  optTxt: String?;
}

contract MixedTypes {
  data: Mixed;

  init() {
    self.data = Mixed{
      n:1, flag:true, addr:myAddress(), txt:"hello", optInt:null, optTxt:null
    };
  }
}