struct Nested {
    x: Int;
    y: Bool?;
}

struct Outer {
    first: Int;
    inner: Nested;
    second: Bool;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            first: 5,
            inner: Nested{ x: 10, y: false },
            second: true,
        };
    }
}