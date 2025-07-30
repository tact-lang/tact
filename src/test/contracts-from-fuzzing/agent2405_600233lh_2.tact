struct Inner {
    flag: Bool;
    value: Int?;
}

struct Middle {
    inner: Inner;
    note: String;
}

contract ComplexStorage {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{ flag: false, value: null },
            note: "test"
        };
    }
}