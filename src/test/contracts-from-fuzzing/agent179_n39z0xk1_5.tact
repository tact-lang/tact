struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    flag: Bool;
    note: String;
}

contract NestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            inner1: Inner{ x: 1, y: "a" },
            inner2: Inner{ x: 2, y: "b" },
            flag: true,
            note: "note"
        };
    }
}