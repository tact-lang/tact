struct Trail {
    a: Int;
    b: Bool;
}

contract TrailingComma {
    t: Trail = Trail{
        a: 1,
        b: true,
    };

    init() {
        self.t = Trail{
            a: 2,
            b: false,
        };
    }
}