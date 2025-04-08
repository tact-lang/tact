struct RecOpt {
    inner: Inner?;
}

struct Inner {
    txt: String?;
    i: Int?;
}

contract OptionalsNested {
    r: RecOpt;
    init() {
        self.r = RecOpt{
            inner: null
        };
    }
}