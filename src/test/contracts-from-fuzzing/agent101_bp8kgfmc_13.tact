struct Strings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract ManyStrings {
    data: Strings = Strings{
        s1: "a",
        s2: "bb",
        s3: "ccc",
        s4: "dddd",
    };

    init() {
        self.data = Strings{
            s1: "w",
            s2: "xx",
            s3: "yyy",
            s4: "zzzz",
        };
    }
}