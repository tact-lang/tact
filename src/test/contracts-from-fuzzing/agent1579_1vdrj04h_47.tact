struct EmptyOpt {
    s: String?;
    i: Int?;
}

contract NestedJustNulls {
    val: EmptyOpt?;
    init() {
        self.val = null;
    }
}