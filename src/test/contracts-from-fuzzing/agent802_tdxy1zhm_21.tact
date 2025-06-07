struct DeeplyNestedOptional {
    inner: Int?;
}

struct Container {
    optStruct: DeeplyNestedOptional?;
}

contract OptionalChain {
    storage: Container;

    init() {
        self.storage = Container{
            optStruct: DeeplyNestedOptional{ inner: null }
        };
    }
}