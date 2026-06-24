struct Outer {
    inner: Inner;
    label: String;
}

struct Inner {
    innermost: Innermost;
}

struct Innermost {
    id: Int;
    note: String;
}

contract MultiNest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ innermost: Innermost{ id: 7, note: "seven" } },
            label: "outer"
        };
    }
}