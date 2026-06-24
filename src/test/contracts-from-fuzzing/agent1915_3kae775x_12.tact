struct MixedNested {
    x: Int;
    y: String;
}

struct OuterMixed {
    inner: MixedNested;
    cond: Bool;
    note: String?;
}

contract MixedDeepStorage {
    top: OuterMixed;

    init() {
        self.top = OuterMixed{
            inner: MixedNested{ x: 123, y: "abc" },
            cond: false,
            note: null
        };
    }
}