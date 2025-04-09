struct StringFields {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract Stringer {
    val: StringFields;
    
    init() {
        self.val = StringFields{
            s1: "test1",
            s2: null,
            s3: "test3",
            s4: null,
        };
    }
}