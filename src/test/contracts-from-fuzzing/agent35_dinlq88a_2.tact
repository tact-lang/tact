struct Nested {
    inner: Int;
    optInner: Int?;
    flag: Bool;
}

struct Outer {
    first: Int;
    nested: Nested;
    second: Int?;
    flag2: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            first: 1,
            nested: Nested{ inner: 2, optInner: null, flag: true },
            second: null,
            flag2: false
        };
    }
}