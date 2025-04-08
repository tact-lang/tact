struct Child {
    foo: Int;
    bar: Int?;
    baz: Bool;
}

contract Test {
    child1: Child;
    child2: Child;

    init() {
        self.child1 = Child{
            foo: 1,
            bar: null,
            baz: true,
        };
        self.child2 = Child{
            foo: 2,
            bar: 3,
            baz: false,
        };
    }
}