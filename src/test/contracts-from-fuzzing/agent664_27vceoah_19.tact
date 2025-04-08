struct SOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptInit {
    s: SOpt;

    init() {
        self.s = SOpt{};
    }
}
