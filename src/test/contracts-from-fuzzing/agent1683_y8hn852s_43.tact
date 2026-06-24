struct SOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalInit {
    opt: SOpt;

    init() {
        self.opt = SOpt{};
    }

    receive() {
        self.opt = SOpt{foo:1,bar:false};
    }
}