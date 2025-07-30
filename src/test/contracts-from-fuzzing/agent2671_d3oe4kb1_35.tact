struct Optd {
    o: Int?;
    b: Bool?;
}

struct Mid {
    a: Int;
    optd: Optd;
}

struct Top {
    m: Mid;
    st: String;
}

contract NestedOptLayers {
    state: Top;

    init() {
        self.state = Top{
            m: Mid{
                a:1,
                optd: Optd{
                    o: null,
                    b: true
                }
            },
            st: "ok"
        };
    }
}