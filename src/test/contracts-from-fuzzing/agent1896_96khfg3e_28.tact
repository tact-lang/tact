struct BoolAndOptionals {
  first: Bool;
  opt1: Int?;
  second: Bool;
  opt2: String?;
  third: Bool;
}

contract BoolOptionalMix {
  data: BoolAndOptionals;

  init() {
    self.data = BoolAndOptionals{
      first:true, opt1:null, second:false, opt2:"hi", third:true
    };
  }
}