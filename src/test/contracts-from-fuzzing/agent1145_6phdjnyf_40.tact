struct ManyEmptyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract ManyEmptyStringsTest {
    data: ManyEmptyStrings;

    init() {
        self.data = ManyEmptyStrings{
            s1:"",
            s2:"",
            s3:"",
            s4:"",
            s5:""
        };
    }
}
