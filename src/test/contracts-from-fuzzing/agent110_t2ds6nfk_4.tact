struct WithOptional {
    foo: Int?;
    bar: String?;
    buzz: Bool?;
}

contract TestContract {
    stuff: WithOptional;

    init() {
        self.stuff = WithOptional{foo: null, bar: null, buzz: null};
    }
}