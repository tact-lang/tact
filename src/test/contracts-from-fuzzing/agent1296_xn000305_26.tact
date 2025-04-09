// optional struct field containing a nested struct
struct Inner {
    foo: Int;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{
                foo: 123,
            },
        };
    }
}