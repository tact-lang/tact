struct InnerMost {
    flag: Bool;
}

struct Inner {
    value: Int;
    optional: InnerMost?;
}

struct Container {
    name: String;
    nested: Inner;
}

contract NestedStorage {
    data: Container;

    init() {
        self.data = Container{
            name: "root",
            nested: Inner{
                value: 1,
                optional: InnerMost{flag: true}
            }
        };
    }
}
