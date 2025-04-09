struct ContainsStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStruct {
    val: ContainsStrings = ContainsStrings{
        s1: "one",
        s2: "two",
        s3: "three"
    };

    init() {}
}
