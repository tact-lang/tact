struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract OptStructHolder {
    val: NestedOpt?;

    init() {
        self.val = null;
    }
}