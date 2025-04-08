struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract Test {
    s: StringStruct;

    init() {
        self.s = StringStruct{
            s1: "One",
            s2: "Two",
            s3: "Three"
        };
    }
}