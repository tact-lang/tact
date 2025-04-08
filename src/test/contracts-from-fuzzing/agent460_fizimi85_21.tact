struct L4 {
    w: Int;
}

struct L3 {
    x: L4;
    opt: Int?;
}

struct L2 {
    y: L3;
    flag: Bool;
}

struct L1 {
    z: L2;
    s: String;
}

contract FourLayersDeep {
    storage: L1;

    init() {
        self.storage = L1{
            z: L2{
                y: L3{
                    x: L4{ w: 1000 },
                    opt: null,
                },
                flag: true,
            },
            s: "deep",
        };
    }
}