// optional struct with many optional fields
struct NestedOptionalMany {
    x: Int?;
    y: Bool?;
    z: String?;
    u: Address?;
    v: Cell?;
}

contract OptionInnerMany {
    opt: NestedOptionalMany?;

    init() {
        self.opt = null;
    }
}