struct LargeStringStruct {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract ManyStringsStorage {
    s: LargeStringStruct;

    init() {
        self.s = LargeStringStruct{
            s1:"abc",
            s2:"defg",
            s3:"hijkl",
            s4:"mnopqr",
            s5:"stuvwx"
        };
    }
}