// optional container struct with nested explicit serialization
struct Nested {
    x: Int as uint4;
    y: Bool;
}

struct Container {
    inner: Nested?;
}

contract OptSerial {
    data: Container?;

    init() {
        self.data = Container{
            inner: Nested{ x: 7, y: false }
        };
    }
}