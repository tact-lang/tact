// nested composite optionals involving structs, optional nested in optional
struct SubOpt {
    a: Int?;
    b: Bool?;
}

struct Top {
    s: String;
    so: SubOpt?;
}

contract NestedOptionalInner {
    val: Top?;
    init() {
        self.val = null;
    }
}