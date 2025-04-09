struct Tiny {
    a: Int;
}

struct Middle {
    field: Tiny?;
}

struct Large {
    m1: Middle;
    m2: Middle;
    s: String;
    b: Bool;
}

contract OptionalDeep {
    data: Large;

    init() {
        self.data = Large{
            m1: Middle{ field: null },
            m2: Middle{ field: null },
            s: "s",
            b: true
        };
    }
}