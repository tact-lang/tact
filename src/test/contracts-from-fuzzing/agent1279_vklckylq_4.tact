struct BoolNest {
    flag: Bool;
}

contract BoolChain {
    val1: BoolNest;
    val2: BoolNest;
    val3: BoolNest;
    val4: BoolNest;
    val5: BoolNest;

    init() {
        self.val1 = BoolNest{flag:false};
        self.val2 = BoolNest{flag:true};
        self.val3 = BoolNest{flag:true};
        self.val4 = BoolNest{flag:false};
        self.val5 = BoolNest{flag:true};
    }
}