struct AllKinds {
    n: Int as uint8;
    flag: Bool;
    message: String;
    address: Address;
    optionalInt: Int?;
    optionalBool: Bool?;
    optStr: String?;
}

contract TestContract {
    record: AllKinds;

    init() {
        self.record = AllKinds{
            n: 7,
            flag: true,
            message: "test",
            address: myAddress(),
            optionalInt: 3,
            optionalBool: false,
            optStr: "opt",
        };
    }
}