struct OptionalDeep {
    val: Int?;
}

contract OptionalDeepStruct {
    field: OptionalDeep?;

    init() {
        self.field = OptionalDeep{val:null};
    }
}