struct Alpha {
    x: Int;
}

struct Beta {
    y: Alpha;
}

struct Gamma {
    z: Beta;
}

contract OptionalDeep {
    field: Gamma?;

    init() {
        self.field = null;
    }
}