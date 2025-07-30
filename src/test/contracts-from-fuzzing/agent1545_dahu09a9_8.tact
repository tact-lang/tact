struct Basic {
    a: Int;
}

struct WithOptional {
    data: Basic?;
}

contract OptionalNested {
    item: WithOptional;

    init() {
        self.item = WithOptional{ data: null };
    }
}
