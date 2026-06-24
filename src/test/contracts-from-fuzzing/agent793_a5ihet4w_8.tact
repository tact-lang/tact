struct OptionalNested {
    d1: Int?;
    d2: Int?;
    s: String?;
}

struct Container {
    nested: OptionalNested;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            nested: OptionalNested{
                d1: 11,
                d2: null,
                s: null
            }
        };
    }

    receive() {}
}