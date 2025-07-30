struct InnerMost {
    flag: Bool;
    count: Int;
}

struct Middle {
    inner: InnerMost;
    note: String?;
}

contract DeepNested {
    data: Middle;

    init() {
        self.data = Middle{
            inner: InnerMost{flag: true, count: 7},
            note: null
        };
    }
}