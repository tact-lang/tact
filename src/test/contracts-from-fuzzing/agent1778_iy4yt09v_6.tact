struct NestedOpt {
    s: String?;
    n: Int?;
}

struct Outer {
    inner: NestedOpt?;
    flag: Bool;
}

contract OptInStruct {
    data: Outer;

    init() {
        self.data = Outer{inner: NestedOpt{s: "a", n: 1}, flag: true};
    }
}