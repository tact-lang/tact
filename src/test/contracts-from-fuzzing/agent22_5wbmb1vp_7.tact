struct BoolChain {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
}

contract TestContract {
    bools: BoolChain;

    init() {
        self.bools = BoolChain{
            f1:true,f2:true,f3:true,f4:true,f5:true,f6:true,f7:true,f8:true,f9:true,f10:true
        };
    }
}