struct Mix {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int?;
    f5: String;
    f6: Bool?;
    f7: Address?;
    f8: String?;
}

contract MixedFieldsContract {
    m: Mix;

    init() {
        self.m = Mix{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: null,
            f5: "hi",
            f6: null,
            f7: null,
            f8: null
        };
    }
}