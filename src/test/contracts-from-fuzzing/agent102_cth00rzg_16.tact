struct Mid {
    inner1: Int;
    inner2: Bool;
}

struct Top {
    topfield: Mid;
    opt: Int?;
}

contract NestedAndOptional {
    val: Top;

    init() {
        self.val = Top{
            topfield: Mid{ inner1: 7, inner2: false },
            opt: null
        };
    }
}