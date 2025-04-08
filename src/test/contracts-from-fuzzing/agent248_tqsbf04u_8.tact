struct D4 {
    q: Int;
}

struct D3 {
    d4: D4;
    txt: String;
}

struct D2 {
    d3: D3;
    flag: Bool;
}

struct D1 {
    d2: D2;
    comment: String;
}

contract UltraDeepNested {
    root: D1;

    init() {
        self.root = D1{
            d2: D2{
                d3: D3{
                    d4: D4{ q: 31337 },
                    txt: "deep"
                },
                flag: false
            },
            comment: "root level"
        };
    }
}