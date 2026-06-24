struct HasStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract NestedStringStruct {
    h: HasStrings;

    init() {
        self.h = HasStrings{ s1:"x", s2:"y", s3:"z" };
    }
}