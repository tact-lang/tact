struct DeepSerialOpt {
    foo: Int? as uint8;
    bar: Bool?;
    baz: String?;
}

struct Container {
    val: DeepSerialOpt;
}

contract NestedSerialOpt {
    nested: Container;

    init() {
        self.nested = Container{
            val: DeepSerialOpt{
                foo: null,
                bar: null,
                baz: null
            }
        };
    }
}
