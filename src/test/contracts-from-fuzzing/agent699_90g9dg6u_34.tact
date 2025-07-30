struct RecOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionList {
    opt1: RecOpt;
    opt2: RecOpt;

    init() {
      self.opt1 = RecOpt{ i: null, b:true, s:null };
      self.opt2 = RecOpt{ i:5, b:null, s:"str" };
    }
}