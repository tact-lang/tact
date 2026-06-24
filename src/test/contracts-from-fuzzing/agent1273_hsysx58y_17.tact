struct OptionalString {
    s: String?;
}

struct Container {
    first: OptionalString;
    second: OptionalString;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            first: OptionalString{ s: null },
            second: OptionalString{ s: null }
        };
    }
}