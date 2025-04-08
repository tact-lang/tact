struct OptionalNested {
    f1: Int?;
    f2: Nested?;
}

struct Nested {
    a: Int;
    b: String;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            f1: null,
            f2: null
        };
    }
}
