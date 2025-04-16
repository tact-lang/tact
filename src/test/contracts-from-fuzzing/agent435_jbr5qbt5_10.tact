// Contract with a nested struct, containing optional nested struct field
struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    innerOptional: Inner?;
    x: Int;
}

contract TestContract {
    nestedOptional: Outer;

    init() {
        self.nestedOptional = Outer{
            innerOptional: null,
            x: 555,
        };
    }
}
