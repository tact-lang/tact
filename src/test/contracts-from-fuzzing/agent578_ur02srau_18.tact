struct StringsAndBools {
    s: String = "foo";
    t: String = "bar";
    f: Bool = false;
    g: Bool?;
}

contract MixTypes {
    m: StringsAndBools;

    init() {
        self.m = StringsAndBools{
            s: "x",
            t: "y",
            f: true,
            g: false
        };
    }
}