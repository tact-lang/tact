// Optional struct with several optional fields inside deeply nested struct
struct Bottom {
    i: Int?;
    s: String?;
}

struct Middle {
    b: Bottom?;
    f: Bool?;
}

struct Top {
    m: Middle?;
}

contract DeepNestedOpt {
    t: Top?;

    init() {
        self.t = Top{
            m: Middle{
                b: null,
                f: null
            }
        };
    }
}