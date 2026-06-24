struct HugeNested {
    inner1: Int;
    inner2: Int;
    inner3: Int;
}

struct Wrapper {
    nested1: HugeNested;
    nested2: HugeNested;
    nested3: HugeNested;
}

contract BigNest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested1: HugeNested{inner1:1, inner2:2, inner3:3},
            nested2: HugeNested{inner1:4, inner2:5, inner3:6},
            nested3: HugeNested{inner1:7, inner2:8, inner3:9}
        };
    }
}
