struct OptNested {
    inner: Inner?;
}

struct Inner {
    num: Int;
    flag: Bool;
}

contract Test {
    data: OptNested;
    init() {
        self.data = OptNested{ inner: null };
    }
}