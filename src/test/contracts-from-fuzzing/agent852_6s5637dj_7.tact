struct Inner {
    nested: String?;
}

struct Outer {
    inside: Inner?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            inside: null
        };
    }
}