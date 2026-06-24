struct Nested {
    a: Int;
    b: Bool;
    inner: Inner;
}

struct Inner {
    c: String;
    d: Bool?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            a: 1,
            b: true,
            inner: Inner{
                c: "hello",
                d: false,
            },
        };
    }
}