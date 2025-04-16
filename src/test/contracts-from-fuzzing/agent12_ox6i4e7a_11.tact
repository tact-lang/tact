struct SWithOpt {
    foo: Int?;
    bar: String?;
}

contract OptStructDefault {
    data: SWithOpt;

    init() {
        self.data = SWithOpt{};
    }

    receive() {
        self.data.foo = 1;
        self.data.bar = "b";
    }
}
