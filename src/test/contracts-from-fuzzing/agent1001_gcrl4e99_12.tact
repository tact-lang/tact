struct MaybeString {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract ManyOptionals {
    data: MaybeString;
    
    init() {
        self.data = MaybeString{
            s1: null,
            s2: "hi",
            s3: null
        };
    }
}