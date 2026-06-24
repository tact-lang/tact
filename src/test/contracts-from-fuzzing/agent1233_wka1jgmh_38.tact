// Check contract defaults with empty init and various field combos
contract FieldsNoInit {
    intF: Int = 5;
    boolF: Bool = false;
    optInt: Int?;
    optStr: String?;
    addrF: Address;

    init() {
        self.addrF = address("0:0000000000000000000000000000000000000000000000000000000000000000");
    }
}