struct IntsAndStrings {
    i1: Int;
    s1: String;
    i2: Int?;
    s2: String?;
    i3: Int;
    s3: String;
}

contract TestContract {
    data: IntsAndStrings;
    init() {
        self.data = IntsAndStrings{
            i1: 1,
            s1: "a",
            i2: null,
            s2: null,
            i3: 3,
            s3: "c"
        };
    }
}