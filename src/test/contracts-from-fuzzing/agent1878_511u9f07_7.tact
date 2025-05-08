struct Bottom {
    f: Int;
}

struct Mid {
    b: Bottom?;
    optInt: Int?;
}

struct Top {
    m: Mid?;
}

contract Test {
    val: Top;

    init() {
        self.val = Top{
            m: Mid{ b: null, optInt: null }
        };
    }
}