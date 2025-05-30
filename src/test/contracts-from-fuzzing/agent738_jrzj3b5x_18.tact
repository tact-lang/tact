struct Strs {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    vals: Strs;
    init() {
        self.vals = Strs{
            s1:"foo",s2:"bar",s3:"baz"
        };
    }
}
