struct Reordered {
    flag: Bool;
    number: Int;
    flag2: Bool;
    text: String;
}

contract ReorderedFields {
    data: Reordered;

    init() {
        self.data = Reordered{
            flag: true,
            number: 123,
            flag2: false,
            text: "reordered"
        };
    }
}