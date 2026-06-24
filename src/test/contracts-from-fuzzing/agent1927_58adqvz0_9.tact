struct Sub {
    s: String;
    f: Bool;
}

struct Mid {
    m: Sub;
}

struct Root {
    r: Mid;
}

contract NullableDeepNested {
    data: Root?;

    init() {
        self.data = null;
    }
}