struct Deep3 {
    c1: Int;
    c2: String?
}

struct Deep2 {
    b1: Bool;
    b2: Deep3;
}

struct Deep1 {
    a1: Int?;
    a2: Deep2;
}

contract DeeplyNested {
    state: Deep1;

    init() {
        self.state = Deep1{
            a1: null,
            a2: Deep2{
                b1: true,
                b2: Deep3{
                    c1: 7,
                    c2: "abc"
                }
            }
        };
    }
}
