struct StrNest {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsStored {
    data: StrNest;

    init() {
        self.data = StrNest{s1:"A", s2:"B", s3:"C"};
    }
}