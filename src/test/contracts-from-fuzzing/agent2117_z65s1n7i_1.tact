struct Nested {
    inner: Inner;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{ inner: Inner{ val: 123 } };
    }
}