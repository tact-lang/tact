struct AlternatingTypes {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
}

contract AlternateFields {
    data: AlternatingTypes;
    
    init() {
        self.data = AlternatingTypes{
            f1: 1,
            f2: true,
            f3: "hello",
            f4: myAddress(),
            f5: 5,
            f6: false,
            f7: "world",
            f8: myAddress(),
        };
    }
}
