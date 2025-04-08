struct Rec {
    x: Bool;
}

contract RecWithOpt {
    maybe: Rec?;

    init() {
        self.maybe = null;
    }
}
