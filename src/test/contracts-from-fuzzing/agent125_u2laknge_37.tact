// large contract with deeply nested optionals and serialization
struct NA {
    a: Int? as int32;
    b: Bool?;
}

struct NB {
    c: String?;
    d: NA;
}

struct NC {
    e: NB?;
    f: Int?;
    g: Bool;
}

contract DeepLarge {
    state: NC;

    init() {
        self.state = NC{
            e: NB{
                c: "zz",
                d: NA{a:123,b:null},
            },
            f: null,
            g: true,
        };
    }
}