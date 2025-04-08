struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsStorage {
    f: StringFields;
    init() {
        self.f = StringFields{
            s1:"hello",
            s2:"world",
            s3:"!"
        };
    }
}