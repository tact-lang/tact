struct Nested {
    flag: Bool;
    amount: Int;
    note: String?;
}

struct Deep {
    inner: Nested;
    optInner: Nested?;
    desc: String;
}

contract DeepStorage {
    val: Deep;

    init() {
        self.val = Deep{
            inner: Nested{ flag: true, amount: 10, note: "hi" },
            optInner: Nested{ flag: false, amount: 20, note: null },
            desc: "deep test"
        };
    }
}