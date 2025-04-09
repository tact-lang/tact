struct OptMixed {
    count: Int as uint32;
    note: String?;
    flag: Bool?;
    ident: String;
}

contract OptionalSerializedMix {
    data: OptMixed;

    init() {
        self.data = OptMixed{
            count: 1234,
            note: null,
            flag: true,
            ident: "id7"
        };
    }
}
