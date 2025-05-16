struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract NestedOptionalContract {
    info: NestedOptional?;

    init() {
        self.info = null;
    }
}