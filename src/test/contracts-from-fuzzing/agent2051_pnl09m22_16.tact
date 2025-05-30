struct Stringy {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStructStorage {
    val: Stringy;

    init() {
        self.val = Stringy{ s1:"a", s2:"b", s3:"c" };
    }
}