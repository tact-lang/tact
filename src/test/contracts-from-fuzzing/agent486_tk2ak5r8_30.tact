struct IntBoolCombo {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

contract TestIntBoolCombo {
    d: IntBoolCombo;

    init() {
        self.d = IntBoolCombo{
            a:1,b:true,c:2,d:false,e:3,f:true
        };
    }
}