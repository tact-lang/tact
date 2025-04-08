// Optional struct type containing optional field
struct InnerOpt {
    num: Int?;
}

contract NestedOptionals {
    field: InnerOpt?;
    init() {
        self.field = null;
    }
}
