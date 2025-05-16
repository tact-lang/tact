struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    val: NestedOptional?;
    init() {
        self.val = null;
    }
}