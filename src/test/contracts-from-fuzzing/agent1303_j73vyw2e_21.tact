struct OptionalNested {
    inner: Cell?;
    optBool: Bool?;
}

struct Larger {
    nested: OptionalNested?;
    flag: Bool;
}

contract TestContract {
    data: Larger;

    init() {
        self.data = Larger{
            nested: null,
            flag: false,
        };
    }
}