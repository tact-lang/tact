struct StringOptionals {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract ManyOptionalStrings {
    val: StringOptionals = StringOptionals{
        s1: null, s2: null, s3: null
    };

    init() {
        self.val = StringOptionals{
            s1:"a", s2:"b", s3:"c"
        };
    }
}