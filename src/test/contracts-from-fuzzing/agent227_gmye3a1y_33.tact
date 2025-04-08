// test mix of nested struct and optional struct fields
struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    p: Int;
    q: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            p: 123,
            q: Inner{ foo: 321, bar: null }
        };
    }
}