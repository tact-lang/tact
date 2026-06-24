struct Stringy {
    s1: String;
    s2: String;
    s3: String?;
}

contract TestContract {
    x: Stringy;
    init() {
        self.x = Stringy{
            s1: "hi",
            s2: "there",
            s3: null,
        };
    }
}