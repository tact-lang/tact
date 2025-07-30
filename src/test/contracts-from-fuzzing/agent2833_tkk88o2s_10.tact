struct Mix {
  num: Int;
  flag: Bool;
  txt: String;
  optNum: Int?;
  optFlag: Bool?;
  optTxt: String?;
}

contract ComboFields {
  a: Mix;
  b: Mix;

  init() {
    self.a = Mix{ num:1, flag:true, txt:"A", optNum:null, optFlag:null, optTxt:null };
    self.b = Mix{ num:2, flag:false, txt:"B", optNum:42, optFlag:true, optTxt:"opt" };
  }
}