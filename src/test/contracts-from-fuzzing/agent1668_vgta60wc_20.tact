struct HasString {
    s: String;
}

struct HasInner {
    i: HasString;
}

struct Wrap {
    iw: HasInner;
}

contract TestContract {
    w: Wrap;
    init() {
        self.w = Wrap{
            iw: HasInner{
                i: HasString{ s: "foobar" }
            }
        };
    }
}
