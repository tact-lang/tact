struct StrOpt {
    s: String?;
    i: Int;
}

contract Test {
    val: StrOpt;

    init() {
        self.val = StrOpt{ s: null, i: 55 };
    }
}