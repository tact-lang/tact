struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    nested: NestedOptional?;
    flag: Bool;
}

contract Test {
    cont: Container;

    init() {
        self.cont = Container{
            nested: null,
            flag: true,
        };
    }
}