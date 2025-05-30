struct S1 {
    i: Int;
}

struct S2 {
    s: String;
}

struct Top {
    f1: S1;
    f2: S2;
}

contract StructInStruct {
    val: Top;

    init() {
        self.val = Top{
            f1: S1{i: 42},
            f2: S2{s: "str"}
        };
    }
}