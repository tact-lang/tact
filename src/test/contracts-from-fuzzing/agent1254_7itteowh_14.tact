struct OptionalWide {
    sa: String?;
    sb: String?;
    ia: Int?;
    ib: Int?;
    ba: Bool?;
    bb: Bool?;
}

contract MultiOptionalStruct {
    val: OptionalWide;
    init() {
        self.val = OptionalWide{
            sa: null,
            sb: null,
            ia: null,
            ib: null,
            ba: null,
            bb: null,
        };
    }
}