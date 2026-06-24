// test optional struct field pointing to nested struct
struct Inner {
    val: Int;
}

struct Outer {
    nestedOpt: Inner?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            nestedOpt: null,
        };
    }
}
