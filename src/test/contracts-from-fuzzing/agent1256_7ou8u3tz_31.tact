struct Bottom {
    flag: Bool?;
}

struct Middle {
    label: String;
    bottom: Bottom;
}

struct Top {
    mid: Middle?;
    num: Int = 321;
    yes: Bool = true;
}

contract NestedMixMega {
    data: Top;

    init() {
        self.data = Top{
            mid: null,
            num: 123,
            yes: false
        };
    }
}