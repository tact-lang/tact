struct OptionalNested {
    nflag: Bool?;
    nval: Int?;
}

contract OptNestedStorage {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ nflag: null, nval: null };
    }
}