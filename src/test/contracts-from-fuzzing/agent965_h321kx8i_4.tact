struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract TestContract {
    value: Large;

    init() {
        self.value = Large{
            f1: 1, f2: true, f3: "a",
            f4: null, f5: false, f6: null,
            f7: 2, f8: false, f9: "b", f10: 3
        };
    }
}