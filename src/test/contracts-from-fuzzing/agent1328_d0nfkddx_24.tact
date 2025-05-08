struct OptNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptCont {
    val: OptNested?;
    init() {
        self.val = null;
    }
}