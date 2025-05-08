struct DeeplyNested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    count: Int;
    label: String;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: Inner{ count: 5, label: "abc" },
            flag: true,
        };
    }
}