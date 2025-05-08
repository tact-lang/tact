struct Deep {
    x: Int;
    y: Int;
    z: Int;
}

struct Mid {
    m: Int;
    deep: Deep;
}

struct Top {
    t: Int;
    mid: Mid;
}

contract NestedTriple {
    data: Top;

    init() {
        self.data = Top{
            t: 7,
            mid: Mid{
                m: 6,
                deep: Deep{
                    x:1,y:2,z:3
                }
            }
        };
    }
}