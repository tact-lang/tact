struct HasManyStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract PersistStrings {
    strStruct: HasManyStrings;

    init() {
        self.strStruct = HasManyStrings{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}
