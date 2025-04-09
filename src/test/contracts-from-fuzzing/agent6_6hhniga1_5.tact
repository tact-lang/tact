struct ContainsNestedOptional {
    nested: Inner?;
}

struct Inner {
    y: Int;
    z: Bool;
}

contract TestContract {
    data: ContainsNestedOptional;

    init() {
        self.data = ContainsNestedOptional{
            nested: null
        };
    }
}
