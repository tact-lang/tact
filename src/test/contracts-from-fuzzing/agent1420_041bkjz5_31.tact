struct Deep {
    f1: Int = 123;
    f2: Bool? = null;
}

struct Mid {
    d: Deep?;
    note: String = "hi";
}

contract TestContract {
    m: Mid;
    init() {
        self.m = Mid{ d: null, note: "yo" };
    }
}