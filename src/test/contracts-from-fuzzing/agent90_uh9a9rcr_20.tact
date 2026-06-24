struct HasStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringMix {
    data: HasStrings;
    init() {
        self.data = HasStrings{ s1:"a", s2:null, s3:"b", s4:null };
    }
}