struct ManyStrings {
    s0: String;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LotsOfStrings {
    saved: ManyStrings;
    init() {
        self.saved = ManyStrings{
            s0:"a", s1:"b", s2:"c", s3:"d", s4:"e"
        };
    }
}