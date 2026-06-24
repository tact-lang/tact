struct Opts {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    thing: Opts?;

    init() {
        self.thing = null;
    }
}
