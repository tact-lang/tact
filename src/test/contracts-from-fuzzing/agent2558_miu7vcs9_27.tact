struct Thing {
    a: Int?;
}

struct Wrap {
    t: Thing?;
}

contract OptWrap {
    val: Wrap;

    init() {
        self.val = Wrap{
            t: null
        };
    }
}