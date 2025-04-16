struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String;
    f6: Bool?;
    f7: String;
    f8: Int; 
    f9: Bool;
    f10: String;
}

contract ManyFields {
    big: Large;

    init() {
        self.big = Large{
            f1: 1, f2: true, f3: "a", f4: null, f5: "b",
            f6: false, f7: "c", f8: 2, f9: false, f10: "d"
        };
    }
}
