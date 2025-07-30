struct Custom {
    flag: Bool;
    text: String;
    count: Int;
    note: String?;
    valid: Bool?;
}

contract ManyOptional {
    c: Custom;
    init() {
        self.c = Custom{
            flag: true,
            text: "hi",
            count: 1,
            note: null,
            valid: null
        };
    }
}