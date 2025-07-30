struct StrFields {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract TestContract {
    strs: StrFields;
    init() {
        self.strs = StrFields{
            s1:"one",
            s2:"two",
            s3:"three",
            s4:"four"
        };
    }
}