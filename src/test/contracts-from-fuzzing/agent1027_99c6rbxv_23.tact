struct SumAndFlags {
  sum: Int as int64;
  flag: Bool;
}

contract ManyStructs {
  s1: SumAndFlags = SumAndFlags{sum:1,flag:true};
  s2: SumAndFlags = SumAndFlags{sum:2,flag:false};

  init() {
    self.s1 = SumAndFlags{sum:100,flag:false};
  }
}
