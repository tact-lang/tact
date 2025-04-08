struct Opt { a: Int?; }

contract OptionalAssignment {
    prop: Opt;

    init() {
        self.prop = Opt{};
    }
}
