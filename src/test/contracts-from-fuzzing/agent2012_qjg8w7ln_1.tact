struct DeepNested {
    innermost: Bool;
}

struct Nested {
    deeper: DeepNested;
}

struct Container {
    nest: Nested;
}

contract TestNested {
    container: Container;

    init() {
        self.container = Container{ nest: Nested{ deeper: DeepNested{ innermost: true } } };
    }
}