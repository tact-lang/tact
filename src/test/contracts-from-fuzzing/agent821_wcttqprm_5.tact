// test optional struct as persistent var
struct Inner {
    num: Int;
    flag: Bool;
}

contract TestOptionalStruct {
    data: Inner? = null;

    init() {
        self.data = Inner{num: 99, flag: true};
    }
}
