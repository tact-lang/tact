struct WithDefaultVal {
    z: Int = 10;
}

struct OuterMixed {
    mandatory: WithDefaultVal;
    optional: WithDefaultVal?;
}

contract NestedWithDefaultsOptionals {
    data: OuterMixed;

    init() {
        self.data = OuterMixed{
            mandatory: WithDefaultVal{},
            optional: null,
        };
    }
}