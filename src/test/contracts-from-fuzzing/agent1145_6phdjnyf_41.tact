// Optional empty strings
struct ManyOptionalEmpty {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
}

contract ManyOptionalEmptyTest {
    data: ManyOptionalEmpty;

    init() {
        self.data = ManyOptionalEmpty{
            s1:null,
            s2:"",
            s3:null,
            s4:""
        };
    }
}
