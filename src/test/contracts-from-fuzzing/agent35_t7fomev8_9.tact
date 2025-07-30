struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    strings: StringStruct;

    init() {
        self.strings = StringStruct{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
        };
    }
}