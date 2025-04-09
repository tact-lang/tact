struct SameStruct {
    a: Int;
}

contract SameStruct1 {
    s: SameStruct;
    init() { self.s = SameStruct{ a: 1 }; }
}

contract SameStruct2 {
    s: SameStruct;
    init() { self.s = SameStruct{ a: 2 }; }
}