struct NestedOptionals {
    first: Int?;
    second: Bool?;
    third: String?;
}

struct Container {
    nested: NestedOptionals?;
    other: Int;
}

contract TestContract {
    cont: Container = Container{
        nested: null,
        other: 0
    };

    init() {
        self.cont = Container{
            nested: NestedOptionals{
                first:123,
                second:null,
                third:"abc"
            },
            other: 42
        };
    }
    receive() {}
}