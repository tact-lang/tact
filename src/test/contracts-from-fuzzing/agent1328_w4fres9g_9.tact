struct StrNest {
    name: String;
    comment: String?;
}

struct Wrap {
    info: StrNest;
}

contract StringWrap {
    val: Wrap;

    init() {
        self.val = Wrap{
            info: StrNest{ name: "hi", comment: null }
        };
    }
}
