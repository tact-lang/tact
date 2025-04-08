struct NestedOptionalStruct {
    x: Int?;
    y: Bool?;
}

struct Container {
    s: NestedOptionalStruct?;
    i: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            s: null,
            i: 42
        };
    }
}