struct NestedLevel {
    info: String;
    flag: Bool;
}

struct Intermediate {
    num: Int;
    inner: NestedLevel;
    optInner: NestedLevel?;
}

contract MultiNest {
    data: Intermediate;

    init() {
        self.data = Intermediate{
            num: 10,
            inner: NestedLevel{
                info: "abc",
                flag: true,
            },
            optInner: null,
        };
    }
}
