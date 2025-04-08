struct Lone {
    value: Int?;
}

contract OptionalLone {
    s: Lone;

    init() {
        self.s = Lone{
            value: null
        };
    }
}