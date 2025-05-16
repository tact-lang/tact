struct StrNest {
    s: String;
    f: Bool;
}

contract StrNestCont {
    val: StrNest;

    init() {
        self.val = StrNest{
            s: "hello",
            f: true,
        };
    }
}