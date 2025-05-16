struct Mix {
    flag: Bool;
    text: String;
    optNum: Int?;
}

contract MixedFields {
    entry: Mix;

    init() {
        self.entry = Mix{
            flag: true,
            text: "hello",
            optNum: 123
        };
    }
}