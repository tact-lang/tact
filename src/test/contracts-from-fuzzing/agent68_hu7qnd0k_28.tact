struct LowBits {
    lo: Int as uint4;
    hi: Int as uint4;
}

struct Container {
    data: LowBits;
    flag: Bool;
}

contract SerialEdge {
    test: Container;

    init() {
        self.test = Container{
            data: LowBits{
                lo: 15,
                hi: 0
            },
            flag: true
        };
    }
}
