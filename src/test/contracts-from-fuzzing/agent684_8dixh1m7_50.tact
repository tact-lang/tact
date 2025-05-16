// optional of nested struct with defaulted field
struct SubD {
    k: Int = 0;
}
struct Wrap {
    s: SubD?;
}
contract OptSubDefault {
    val: Wrap;
    init() {
        self.val = Wrap {
            s: null
        };
    }
}