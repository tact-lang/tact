struct Bottom {
    x: Int?;
}

struct Middle {
    a: Int;
    b: Bottom?;
}

struct TopLevel {
    mid: Middle?;
    y: String;
}

contract NullablePyramid {
    val: TopLevel;

    init() {
        self.val = TopLevel{
            mid: Middle{
                a: 1,
                b: Bottom{ x: null },
            },
            y: "hey",
        };
    }
}