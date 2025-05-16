struct Long {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool;
    f5: String;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Bool;
    f10: String;
}

contract ManyStructFields {
    s: Long;

    init() {
        self.s = Long{
            f1: 1,
            f2: false,
            f3: "a",
            f4: false,
            f5: "b",
            f6: 2,
            f7: true,
            f8: "c",
            f9: true,
            f10: "d",
        };
    }
}