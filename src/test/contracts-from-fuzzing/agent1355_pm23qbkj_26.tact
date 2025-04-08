struct Sub {
    a: Int;
    b: Bool;
    c: String;
}

struct Mid {
    x: Int;
    y: Sub;
}

struct Top {
    m: Mid;
    z: Bool;
}

contract FullChain {
    data: Top;
    init() {
        self.data = Top{
            m: Mid{
                x: 9,
                y: Sub{
                    a: 2,
                    b: false,
                    c: "yo"
                }
            },
            z: true
        };
    }
}