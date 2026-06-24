struct HasStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringHeavy {
    val: HasStrings;

    init() {
        self.val = HasStrings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
        };
    }

    receive() {
        let v = self.val;
    }
}