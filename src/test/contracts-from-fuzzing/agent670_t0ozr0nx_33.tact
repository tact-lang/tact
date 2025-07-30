struct NestedOptionalStruct {
    a: Int;
    b: Int?;
}

struct Container {
    nested: NestedOptionalStruct?;
    c: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nested: null,
            c: 42
        };
    }
}