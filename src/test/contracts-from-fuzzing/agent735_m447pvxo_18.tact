struct Outer {
    f1: Int;
    f2: Inner?;
}

struct Inner {
    name: String;
    flag: Bool;
}

contract OptionalStruct {
    v: Outer;
    init() {
        self.v = Outer{f1: 99, f2: null};
    }
}