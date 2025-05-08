struct IntBoolCombo {
    i: Int;
    b: Bool;
}

contract NestedManyTimes {
    q: IntBoolCombo;
    w: IntBoolCombo;
    e: IntBoolCombo;
    r: IntBoolCombo;
    t: IntBoolCombo;
    y: IntBoolCombo;

    init() {
        self.q=IntBoolCombo{i:1,b:true};
        self.w=IntBoolCombo{i:2,b:false};
        self.e=IntBoolCombo{i:3,b:true};
        self.r=IntBoolCombo{i:4,b:false};
        self.t=IntBoolCombo{i:5,b:true};
        self.y=IntBoolCombo{i:6,b:false};
    }

    receive() {
        let _ = self.q;
        let _ = self.w;
        let _ = self.e;
        let _ = self.r;
        let _ = self.t;
        let _ = self.y;
    }
}