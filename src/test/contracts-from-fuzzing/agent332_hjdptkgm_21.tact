contract StructFieldTest {
    inner: Inner;
    
    init() {
        self.inner = Inner{ a: 11, b: "hi" };
    }
}

struct Inner {
    a: Int;
    b: String;
}