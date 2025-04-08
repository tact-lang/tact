struct InnerLevel {
    a: Int = 10;
    b: Bool = false;
}

struct MiddleLevel {
    inner: InnerLevel;
    c: String = "test";
}

contract DeepNestedContract {
    nested: MiddleLevel;

    init() {
        self.nested = MiddleLevel{
            inner: InnerLevel{ a: 42, b: true },
            c: "deep"
        };
    }
    
    receive() {}
}