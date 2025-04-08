struct Opts {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    f: Opts?;
    init() {
        self.f = null;
    }
}
