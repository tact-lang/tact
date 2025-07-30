struct Inner {
    flag: Bool;
    note: String;
}

struct Outer {
    num: Int as uint32;
    inner: Inner;
}

contract NestedStructStorage {
    outer: Outer;

    init() {
        self.outer = Outer{
            num: 42,
            inner: Inner{
                flag: true,
                note: "nested",
            }
        };
    }
}