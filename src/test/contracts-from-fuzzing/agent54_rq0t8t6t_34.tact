struct OptionalAll {
    intopt: Int?;
    boolopt: Bool?;
    stropt: String?;
    addropt: Address?;
}

contract OptionalAllContract {
    val: OptionalAll;

    init() {
        self.val = OptionalAll{
            intopt: null,
            boolopt: true,
            stropt: null,
            addropt: myAddress()
        };
    }
}