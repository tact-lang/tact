struct Nested {
    i: Int?;
    b: Bool?;
    a: Address?;
}

struct Container {
    n: Nested?;
}

contract Test {
    store: Container;

    init() {
        self.store = Container{
            n: null
        };
    }
}