struct Bottom {
    num: Int?;
}

struct Middle {
    bottom: Bottom?;
}

struct Upper {
    middle: Middle?;
}

contract MultiOptLevels {
    state: Upper?;

    init() {
        self.state = Upper{
            middle: Middle{
                bottom: null
            }
        };
    }
}
