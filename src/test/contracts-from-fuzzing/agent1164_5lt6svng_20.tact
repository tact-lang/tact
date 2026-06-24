struct AA {
    val: Int;
}

struct BB {
    a: AA;
    opt: AA?;
}

contract NestedOptionalStruct {
    b: BB;

    init() {
        self.b = BB{
            a: AA{val: 1},
            opt: null
        };
    }
}