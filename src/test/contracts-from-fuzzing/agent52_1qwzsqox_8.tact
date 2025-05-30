struct StringFields {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract TestContract {
    texts: StringFields;

    init() {
        self.texts = StringFields{
            s1:"hello", s2:"world", s3:"Tact", s4:"blockchain"
        };
    }
}
