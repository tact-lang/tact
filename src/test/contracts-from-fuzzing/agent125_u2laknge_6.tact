struct Param {
    num: Int;
    flag: Bool;
    text: String;
}

struct Wrapper {
    p1: Param;
    p2: Param;
    p3: Param;
}

contract NestedFields {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            p1: Param{num: 1, flag: true, text: "A"},
            p2: Param{num: 2, flag: false, text: "B"},
            p3: Param{num: 3, flag: true, text: "C"},
        };
    }
}