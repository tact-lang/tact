struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    val: StringStruct;

    init() {
        self.val = StringStruct{
            s1: "one",
            s2: "two",
            s3: "three",
        };
    }
}