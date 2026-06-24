struct OptNestedPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
}

contract SingleOptNest {
    val: OptNestedPrimitives?;

    init() {
        self.val = null;
    }
}