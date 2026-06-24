struct Nested {
    val1: Int;
    val2: Bool;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: String;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            val1: 123,
            val2: true,
            inner: Inner{
                x: 42,
                y: "hello"
            }
        };
    }
}