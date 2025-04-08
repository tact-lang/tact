struct Sample {
    num: Int;
    flag: Bool;
    text: String;
    optInt: Int?;
    optText: String?;
}

contract TestContract {
    storage: Sample;

    init() {
        self.storage = Sample{
            num: 10,
            flag: false,
            text: "abc",
            optInt: null,
            optText: null,
        };
    }
}
