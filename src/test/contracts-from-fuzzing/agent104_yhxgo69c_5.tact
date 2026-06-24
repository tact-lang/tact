struct NestedOpt {
    opt1: Int?;
    opt2: Bool?;
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    txt: String?;
}

contract TestContract {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{
            opt1: null,
            opt2: null,
            inner: null
        };
    }
}