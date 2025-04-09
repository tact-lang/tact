struct SingleBit {
  flag1: Bool;
  flag2: Bool;
  flag3: Bool;
  optFlag: Bool?;
}

contract Bits {
    field: SingleBit;

    init() {
        self.field = SingleBit{ flag1:true, flag2:true, flag3:false, optFlag:null };
    }
}