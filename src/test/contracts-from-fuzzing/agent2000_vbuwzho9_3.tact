struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool?;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
}

contract ManyFields {
    st: Large;
    
    init() {
        self.st = Large{
            f1: 1,
            f2: true,
            f3: "A",
            f4: myAddress(),
            f5: null,
            f6: null,
            f7: "B",
            f8: myAddress(),
            f9: 9,
            f10: false,
        };
    }
}