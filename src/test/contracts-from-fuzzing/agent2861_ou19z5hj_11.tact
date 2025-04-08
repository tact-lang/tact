struct IntStruct {
    a: Int;
}

struct BoolStruct {
    b: Bool;
}

struct Mixed {
    intPart: IntStruct;
    boolPart: BoolStruct;
    num: Int;
    flag: Bool;
}

contract MixedTypes {
    m: Mixed;

    init() {
        self.m = Mixed{
            intPart: IntStruct{a:1},
            boolPart: BoolStruct{b:true},
            num: 5,
            flag: false
        };
    }
}