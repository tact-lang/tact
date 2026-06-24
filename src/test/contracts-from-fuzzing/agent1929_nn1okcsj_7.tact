struct SomeStruct1 {
    a: Int;
    b: Bool?;
}

struct SomeStruct2 {
    s1: SomeStruct1;
    c: Bool;
}

contract OptionOnStruct {
    opt: SomeStruct2?;
    init() {
        self.opt = SomeStruct2{
            s1: SomeStruct1{ a: 21, b: null },
            c: true
        };
    }
}