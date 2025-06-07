struct Inner {
    d: Int = 42;
    e: Bool?;   
}

struct Outer {
    a: Int = 1;
    b: String = "Hi";
    c: Inner;
}

contract NestedStructTest {
    data: Outer = Outer{ c: Inner{} };

    init() {
        self.data = Outer{
            a: 123,
            b: "test",
            c: Inner{ d: 7, e: true }
        };
    }
}
