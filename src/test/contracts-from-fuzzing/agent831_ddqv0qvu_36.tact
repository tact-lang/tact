struct NestedBool {
    a: Bool;
    b: Bool;
}

struct NestedInt {
    a: Int;
    b: Int;
}

struct TopCombo {
    nBool: NestedBool;
    nInt: NestedInt;
    flag: Bool;
}

contract Combo {
    data: TopCombo;
    init() {
        self.data = TopCombo{
            nBool: NestedBool{a:true,b:false},
            nInt: NestedInt{a:5,b:6},
            flag: true
        };
    }
}