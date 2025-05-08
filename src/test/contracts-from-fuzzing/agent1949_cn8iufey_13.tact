struct OptionalNested {
    i: Int?;
    s: String?;
    c: Cell?;
}

struct Container {
    opt: OptionalNested?;
}

contract OptionalInOptional {
    state: Container;

    init() {
        self.state = Container{ opt: null };
    }
}
