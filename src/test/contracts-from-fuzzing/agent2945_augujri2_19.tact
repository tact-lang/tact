struct MultiType {
    intField: Int;
    boolField: Bool;
    optInt: Int?;
    optBool: Bool?;
    text: String;
}

contract DiverseFields {
    m: MultiType;

    init() {
        self.m = MultiType{
            intField: 444,
            boolField: false,
            optInt: null,
            optBool: null,
            text: "abc"
        };
    }
}