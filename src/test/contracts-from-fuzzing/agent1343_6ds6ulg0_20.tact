struct SerializeStruct {
    small: Int as uint8;
    big: Int as uint128;
}

contract StructedSerialize {
    fld: SerializeStruct;

    init() {
        self.fld = SerializeStruct{small:5, big:123456789};
    }
}
