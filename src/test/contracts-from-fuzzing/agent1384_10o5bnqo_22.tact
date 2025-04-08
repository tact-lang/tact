struct MultipleStrings {
    s1: String;
    s2: String;
    s3: String?;
    s4: String?;
}

contract MultiStringFields {
    d: MultipleStrings;

    init() {
        self.d = MultipleStrings{
            s1:"A",s2:"B",s3:null,s4:"D"
        };
    }
}