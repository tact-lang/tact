struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct Container {
    nested: NestedOptional?;
}

contract OptionalInOptionalTest {
    cont: Container;

    init() {
        self.cont = Container{
            nested: null,
        };
    }
}