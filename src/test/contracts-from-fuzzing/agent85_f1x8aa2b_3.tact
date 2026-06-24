struct Inner {
    v1: Int;
    v2: Bool;
}

struct Outer {
    inner: Inner;
    message: String;
}

contract DeepNestedField {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Inner{
                v1: 12,
                v2: false,
            },
            message: "hello"
        };
    }

    receive() {}
}