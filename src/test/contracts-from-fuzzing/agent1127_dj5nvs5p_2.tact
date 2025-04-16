struct Nested {
    num: Int;
    flag: Bool;
}

struct Outer {
    inner: Nested;
    value: Int?;
}

contract TestContract {
    rec: Outer;

    init() {
        self.rec = Outer{
            inner: Nested{
                num: 7,
                flag: false,
            },
            value: null,
        };
    }
}
