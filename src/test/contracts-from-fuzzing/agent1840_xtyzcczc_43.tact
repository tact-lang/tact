struct DeepStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract DeepStrs {
    s: DeepStrings;
    init() {
        self.s = DeepStrings{
            a:"1",b:"2",c:"3",d:"4",e:"5"
        };
    }
}