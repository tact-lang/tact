struct Inner {
    x: Int;
    y: String?;
}

struct Outer {
    a: Inner?;
    b: Inner;
    c: Int;
}

contract StorageTest {
    value: Outer;

    init() {
        self.value = Outer{
            a: null,
            b: Inner{
                x: 1,
                y: "hello"
            },
            c: 5
        };
    }
}