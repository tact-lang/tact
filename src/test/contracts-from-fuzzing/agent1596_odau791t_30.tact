struct NestedDefault {
    a: Int = 10;
    b: Bool = false;
}

struct ContainerWithDefault {
    nested: NestedDefault;
    c: Int = 5;
}

contract NestedWithDefaults {
    f: ContainerWithDefault = ContainerWithDefault{
        nested: NestedDefault{}
    };
    receive() {
        let _ = self.f.nested.b;
    }
}