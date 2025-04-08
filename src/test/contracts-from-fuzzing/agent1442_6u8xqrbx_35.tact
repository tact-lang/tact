// nested struct, serialization with optional
struct Inner {
    val: Int as uint8;
    flag: Bool;
}

struct Outer {
    inner: Inner?;
    number: Int as int16;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{inner: null, number: -123};
    }
}