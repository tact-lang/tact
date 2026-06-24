struct OptNested {
    a: Int;
    b: Bool?;
    c: String?;
}

contract TestContract {
    state: OptNested;

    init() {
        self.state = OptNested{
            a: 12,
            b: null,
            c: null,
        };
    }
}