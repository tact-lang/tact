struct Level2 {
    val: Int;
    txt: String?;
}

struct Level1 {
    nestedOpt: Level2?;
    flag: Bool;
    optNum: Int?;
}

struct Top {
    inner: Level1?;
    finalVal: Bool;
}

contract OptionalDeepNested {
    state: Top;

    init() {
        self.state = Top{
            inner: null,
            finalVal: true
        };
    }
}
