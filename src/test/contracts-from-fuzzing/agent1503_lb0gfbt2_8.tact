struct Large {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Address?;
    f9: Int?;
    f10: Address;
}

contract StructAsField {
    val: Large;

    init() {
        self.val = Large {
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "hi",
            f5: null,
            f6: null,
            f7: 7,
            f8: null,
            f9: null,
            f10: myAddress()
        };
    }

    receive() {}
}