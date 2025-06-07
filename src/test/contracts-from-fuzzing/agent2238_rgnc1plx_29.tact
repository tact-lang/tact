// Test optional nested structs with optional fields
struct Inner {
    x: Int?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            inner: null
        };
    }
}
