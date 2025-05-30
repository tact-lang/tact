struct Deep {
    value: Int as uint8;
}

struct Middle {
    deep: Deep?;
}

struct Top {
    middle: Middle;
}

contract TestContract {
    top: Top;

    init() {
        self.top = Top{
            middle: Middle{
                deep: null
            }
        };
    }
}