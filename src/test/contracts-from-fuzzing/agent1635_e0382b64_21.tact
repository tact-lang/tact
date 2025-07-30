struct Inner {
    intOpt: Int?;
    boolOpt: Bool?;
}

struct Layer2 {
    a: Inner;
    b: Inner?;
}

contract OptionMix {
    content: Layer2?;

    init() {
        self.content = null;
    }
}
