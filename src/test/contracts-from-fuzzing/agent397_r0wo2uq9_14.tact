struct StringHolder {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    data: StringHolder;

    init() {
        self.data = StringHolder{
            s1: "alpha",
            s2: "beta",
            s3: "gamma"
        };
    }
}