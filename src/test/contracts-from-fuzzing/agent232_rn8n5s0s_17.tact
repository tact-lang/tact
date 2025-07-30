struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStore {
    store: StringStruct;

    init() {
        self.store = StringStruct{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}