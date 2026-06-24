struct Tiny {
    f: Bool;
}

contract JustBool {
    bit: Tiny;

    init() {
        self.bit = Tiny{ f: true };
    }
}