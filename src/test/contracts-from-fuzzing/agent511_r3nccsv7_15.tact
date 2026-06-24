struct SingleBool {
    b: Bool;
}

contract WithBool {
    f: SingleBool;

    init() {
        self.f = SingleBool{ b: false };
    }
}