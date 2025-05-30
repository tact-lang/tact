// contract with nested, deeply mixed optionals and defaults
struct InnerD {
    a: Int = 1;
    b: Bool?;
}
struct MiddleD {
    c: InnerD?;
    d: String = "x";
}
contract DefaultMix {
    val: MiddleD?;
    init() {
        self.val = null;
    }
}