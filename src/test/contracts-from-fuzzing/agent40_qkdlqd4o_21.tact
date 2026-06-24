struct SOptionals {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalStrings {
    data: SOptionals;

    init() {
        self.data = SOptionals{
            s1:null,
            s2:null,
            s3:null
        };
    }
}