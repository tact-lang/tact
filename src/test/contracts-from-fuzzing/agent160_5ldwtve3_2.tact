struct Nested {
    inner: Inner;
    z: Int;
}

struct Inner {
    value: Int;
}

contract TestNested {
    state: Nested;
    
    init() {
        self.state = Nested{
            inner: Inner{ value: 10 },
            z: 20,
        };
    }
}