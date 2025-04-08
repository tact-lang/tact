struct StructA {
    str: String;
    opt: Int?;
}

struct StructB {
    sa: StructA;
    num: Int;
    flag: Bool;
}

contract TestContract {
    s: StructB;

    init() {
        self.s = StructB{
            sa: StructA{ str: "hello", opt: null },
            num: -5,
            flag: false
        };
    }
}