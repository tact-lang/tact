struct NestedOptionalStruct {
    foo: Int?;
    bar: String?;
}

struct Container {
    nested: NestedOptionalStruct?;
    flag: Bool;
}

contract TestContract {
    state: Container;

    init() {
        self.state = Container{
            nested: null,
            flag: true,
        };
    }
}