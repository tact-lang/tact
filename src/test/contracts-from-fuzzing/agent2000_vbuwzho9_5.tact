struct InnerMost {
    flag: Bool;
    descr: String;
}

struct Mid {
    inner: InnerMost;
    val: Int;
}

struct Container {
    mid: Mid;
    another: Mid;
    note: String;
}

contract NestedStructOptions {
    data: Container?;

    init() {
        self.data = null;
    }
}