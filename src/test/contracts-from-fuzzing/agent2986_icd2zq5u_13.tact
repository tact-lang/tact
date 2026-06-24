struct NestedMany {
    aa: Int?;
    ab: Bool?;
    ac: String?;
    ad: Address?;
    ae: Cell?;
    af: Builder?;
    ag: Slice?;
}

contract OptionalLayeredStruct {
    nested: NestedMany?;

    init() {
        self.nested = null;
    }
}