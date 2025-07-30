struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    inner: Inner;
    message: String;
}

contract OptionalNested {
    storage: Outer;
    
    init() {
        self.storage = Outer{
            inner: Inner{ a: null, b: true },
            message: "Test"
        };
    }
}