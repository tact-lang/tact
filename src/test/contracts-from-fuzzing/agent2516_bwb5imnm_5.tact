struct Deep1 {
    x: Int;
}

struct Deep2 {
    d1: Deep1;
    y: Int?;
}

struct Deep3 {
    d2: Deep2;
    z: Bool;
}

struct Deep4 {
    d3: Deep3;
    s: String?;
}

struct Deep5 {
    d4: Deep4;
    addr: Address;
}

contract DeepNest {
    data: Deep5;

    init() {
        self.data = Deep5{
            d4: Deep4{
                d3: Deep3{
                    d2: Deep2{
                        d1: Deep1{ x: 5 },
                        y: null,
                    },
                    z: true,
                },
                s: null,
            },
            addr: myAddress(),
        };
    }
}