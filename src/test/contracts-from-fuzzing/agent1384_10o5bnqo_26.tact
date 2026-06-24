struct StringVariants {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringFields {
    data: StringVariants;

    init() {
        self.data = StringVariants{s1:"hello",s2:null,s3:"world",s4:"!"};
    }
}