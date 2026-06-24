struct InnerMost {
    flag: Bool;
    count: Int?;
}

struct Middle {
    im: InnerMost?;
    note: String;
}

struct Outer {
    mid: Middle?;
    value: Int;
}

contract NestedTest {
    persist: Outer;

    init() {
        self.persist = Outer{
            mid: Middle{
                im: InnerMost{ flag: true, count: null },
                note: "ok"
            },
            value: 10
        };
    }
}