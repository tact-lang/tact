struct DeepInner {
    xi: Int;
    yi: Int?;
}

struct Middle {
    mi1: DeepInner;
    mi2: Int;
}

contract DeeplyNested {
    coord: Middle;

    init() {
        self.coord = Middle{
            mi1: DeepInner{ xi: 10, yi: null },
            mi2: 5
        };
    }
}