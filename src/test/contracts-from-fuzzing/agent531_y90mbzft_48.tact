struct MultiLevel {
    s: Slice;
    b: Bool;
    t: String;
}

struct Higher {
    ml: MultiLevel;
    num: Int;
}

contract NestedStorage {
    h: Higher;

    init() {
        self.h = Higher{
            ml: MultiLevel{
                s: emptyCell().asSlice(),
                b: true,
                t: "hi"
            },
            num: 100
        };
    }
}