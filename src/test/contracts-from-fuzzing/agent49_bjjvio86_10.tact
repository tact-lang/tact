struct InnerStructOpt {
    val: Int?;
}

struct Container {
    nested: InnerStructOpt?;
}

contract NestedOptionalStruct {
    data: Container;

    init() {
        self.data = Container{
            nested: null,
        };
    }
}
