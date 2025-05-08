struct OptStruct {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    inner: OptStruct?;
}

contract OptionContainer {
    s: Container;

    init() {
        self.s = Container{
            inner: null
        };
    }
}