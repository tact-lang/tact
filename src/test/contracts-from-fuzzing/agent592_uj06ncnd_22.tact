struct Abc {
    a: Int;
    b: Bool;
    c: String;
}

struct NestedOpt {
    val: Abc?;
    num: Int;
    flag: Bool;
}

contract OptNestedContract {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}