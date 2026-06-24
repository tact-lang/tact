struct SWithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsContract {
    data: SWithStrings;

    init() {
        self.data = SWithStrings{
            s1:"hello",
            s2:"world",
            s3:"!",
        };
    }
}
