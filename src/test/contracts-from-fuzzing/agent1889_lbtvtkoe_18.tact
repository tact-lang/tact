struct MixTypes {
    flag: Bool;
    txt: String;
    num: Int;
    optNum: Int?;
    optStr: String?;
}

contract MixTypesStorage {
    storage: MixTypes;

    init() {
        self.storage = MixTypes{
            flag: true,
            txt: "mix",
            num: 43,
            optNum: null,
            optStr: "hi"
        };
    }
}
