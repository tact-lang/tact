struct Bottom {
    x: Int?;
    y: Bool?;
}

struct Middle {
    btm: Bottom?;
    value: Int?;
}

struct Top {
    mid: Middle?;
}

contract DeepOptionals {
    deep: Top;

    init() {
        self.deep = Top{
            mid: Middle{
                btm: Bottom{x: null, y: true},
                value: null
            }
        };
    }
}