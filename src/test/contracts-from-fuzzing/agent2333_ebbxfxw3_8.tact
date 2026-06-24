struct StringHolder {
    a: String;
    b: String;
    c: String;
}

contract TestStrings {
    data: StringHolder;

    init() {
        self.data = StringHolder{
            a: "alpha",
            b: "beta",
            c: "gamma"
        };
    }
}