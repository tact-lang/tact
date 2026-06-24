// deeply nested mix optional and non-optional
struct N3 {
    d: Int;
    e: Bool?;
}

struct N2 {
    c: String?;
    n3: N3;
}

struct N1 {
    a: Int;
    b: N2?;
}

contract MixDeep {
    root: N1;

    init() {
        self.root = N1 {
            a: 5,
            b: N2 {
                c: null,
                n3: N3 {
                    d: 17,
                    e: null
                }
            }
        };
    }
}