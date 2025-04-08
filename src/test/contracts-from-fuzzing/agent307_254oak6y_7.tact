struct OptionalNested {
    innerOpt: Int?;
    innerBool: Bool?;
}

struct Container {
    first: OptionalNested?;
    second: OptionalNested;
}

contract TestContract {
    c: Container;
    init() {
        self.c = Container{
            first: null,
            second: OptionalNested{ innerOpt: 5, innerBool: true }
        };
    }
}