struct Mix {
    id: Int;
    name: String;
    flag: Bool;
    maybeVal: Int?;
    maybeText: String?;
}

contract MixedFields {
    m: Mix;

    init() {
        self.m = Mix{
            id: 1,
            name: "mix",
            flag: true,
            maybeVal: null,
            maybeText: null
        };
    }
}