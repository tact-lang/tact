struct DeepOptional {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

struct Container {
    inner: DeepOptional? = null;
}

contract DeepOptFields {
    payload: Container;
    init() {
        self.payload = Container{
            inner: DeepOptional{ a: 1, b: "text", c: true }
        };
    }
}