struct SubSub {
    z: Bool;
}

struct Sub {
    y: Int;
    subsub: SubSub;
}

struct Top {
    x: Int;
    sub: Sub;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            x: 1,
            sub: Sub{
                y: 2,
                subsub: SubSub{
                    z: true
                }
            }
        };
    }
}
