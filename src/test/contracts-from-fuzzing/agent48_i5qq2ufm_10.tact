struct AllOptionalNested {
    innerOpt: Int?;
    strOpt: String?;
}

struct OptionalHolder {
    nested: AllOptionalNested?;
    addrOpt: Address?;
}

contract OptionalNestStorage {
    st: OptionalHolder?;

    init() {
        self.st = null;
    }

    receive() {}
}