// optional of struct with optional nested struct
struct NestedOpt {
    x: Int;
    y: Bool?;
}

struct Wrapper {
    nested: NestedOpt?;
}

contract TestContract {
    foo: Wrapper?;
    init() {
        self.foo = Wrapper{
            nested: NestedOpt{
                x: 7,
                y: null
            }
        };
    }
}