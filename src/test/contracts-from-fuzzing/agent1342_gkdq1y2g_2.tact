struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inside: Inner;
    flag: Bool;
    note: String;
    optInner: Inner?;
}

contract StorageTest {
    state: Outer;

    init() {
        self.state = Outer{
            inside: Inner{ x: 10, y: 20 },
            flag: true,
            note: "Fuzz",
            optInner: null
        };
    }
}