message(1) M { v: Int; }

struct ContainOpt {
    m: M?;
    x: Int?;
}

contract OptMixCombo {
    field1: Int;
    field2: ContainOpt;
    field3: Bool?;
  
    init() {
        self.field1 = 5;
        self.field2 = ContainOpt{ m: null, x: null };
        self.field3 = null;
    }
}