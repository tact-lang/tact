struct NestedAndOptionals {
    s: String?;
    i: Int?;
    b: Bool;
}

struct Container {
    nested: NestedAndOptionals?;
    val: Int;
}

contract NestedOptFields {
    container: Container;

    init() {
        self.container = Container{
            nested: null,
            val: 100,
        };
    }
}