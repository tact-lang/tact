struct Tiny {
    b: Bool;
}

struct OptionalTiny {
    t: Tiny?;
}

contract TestContract {
    optTiny: OptionalTiny;

    init() {
        self.optTiny = OptionalTiny{ t: Tiny{ b: true } };
    }
}