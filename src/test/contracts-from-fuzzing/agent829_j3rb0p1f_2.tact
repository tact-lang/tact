struct Nested {
    inner: Int;
    flag: Bool;
}

struct Outer {
    nested: Nested;
    status: Bool;
}

contract Test {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Nested{
                inner: 99,
                flag: false,
            },
            status: true,
        };
    }
}