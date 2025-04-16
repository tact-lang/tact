struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract Test {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Nested{ a: 5, b: true },
            flag: false
        };
    }
}