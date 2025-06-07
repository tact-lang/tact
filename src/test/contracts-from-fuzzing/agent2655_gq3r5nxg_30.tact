struct OptStr {
    text: String?;
}

struct Container {
    foo: Int;
    optStr: OptStr?;
}

contract OptionalsWithin {
    data: Container;

    init() {
        self.data = Container{
            foo: 1,
            optStr: null,
        };
    }
}