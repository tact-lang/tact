struct Deep {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool?;
    f9: Int;
    f10: Bool;
}

contract ManyFields {
    storage: Deep;

    init() {
        self.storage = Deep{
            f1: 1,
            f2: true,
            f3: null,
            f4: false,
            f5: 5,
            f6: false,
            f7: null,
            f8: null,
            f9: 42,
            f10: true
        };
    }
}