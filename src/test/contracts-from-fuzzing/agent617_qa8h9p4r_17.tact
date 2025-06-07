struct Rec {
    num: Int;
    inner: RecOption;
}

struct RecOption {
    op: Int?;
    deeper: RecDeep?;
}

struct RecDeep {
    flag: Bool;
}

contract RecursiveOpt {
    val: Rec;
    init() {
        self.val = Rec{
            num: 1,
            inner: RecOption{ op: null, deeper: RecDeep{ flag: true } }
        };
    }
}