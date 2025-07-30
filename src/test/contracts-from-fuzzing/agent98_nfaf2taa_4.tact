struct OptNested {
    value: Int?;
    flag: Bool?;
}

struct Container {
    mainVal: Int;
    nested: OptNested;
}

contract OptionalContainer {
    data: Container;

    init() {
        self.data = Container{
            mainVal: 1,
            nested: OptNested{ value: null, flag: true }
        };
    }
}