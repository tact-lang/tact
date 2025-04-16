struct DeeplyNestedOptional {
    inner: Int?;
}

struct Container {
    nested: DeeplyNestedOptional?;
}

contract Test10 {
    f: Container?;

    init() {
        self.f = Container{
            nested: null
        };
    }
}