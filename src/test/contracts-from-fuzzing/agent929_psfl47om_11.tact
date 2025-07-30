struct StructWithOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addrOpt: Address?;
}

contract StructOptionalsUse {
    inner: StructWithOptionals;

    init() {
        self.inner = StructWithOptionals{
            intOpt: 1000,
            boolOpt: false,
            stringOpt: "data",
            addrOpt: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }
}