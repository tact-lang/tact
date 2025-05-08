struct Nested {
    inner: Int;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    opt: Int?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Nested{inner: 10},
            flag: true,
            opt: null,
        };
    }
    receive() {}
}