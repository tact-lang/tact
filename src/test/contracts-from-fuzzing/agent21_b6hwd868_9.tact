struct OptionalDeep {
    inner: Int?;
}

struct Container {
    first: OptionalDeep;
    second: OptionalDeep?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            first: OptionalDeep{ inner: null },
            second: null
        };
    }
}