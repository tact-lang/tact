struct WithOptional {
    v: Int?;
}

contract InheritOptional {
    s: WithOptional;

    init() {
        self.s = WithOptional{ v: null };
    }
}