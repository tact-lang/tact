struct Stringy {
    s1: String;
    s2: String?;
    s3: String;
}

contract MoreStrings {
    data: Stringy;

    init() {
        self.data = Stringy{s1:"abc", s2:null, s3:"xyz"};
    }
}