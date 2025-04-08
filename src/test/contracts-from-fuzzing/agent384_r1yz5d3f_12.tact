struct EmbedStringsOptionals {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
}

contract OptionalStrings {
    data: EmbedStringsOptionals;

    init() {
        self.data = EmbedStringsOptionals{
            s1:null,s2:null,s3:null,s4:null
        };
    }
}