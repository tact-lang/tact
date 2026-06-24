struct InnerOpt {
    s: String?;
    flag: Bool;
}

contract StructWithOptField {
    val: InnerOpt;

    init() {
        self.val = InnerOpt{ s: null, flag: true };
    }
}
