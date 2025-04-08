struct ContainsString {
    s1: String;
    s2: String;
}

contract DoubleString {
    data: ContainsString;

    init() {
        self.data = ContainsString{
            s1: "foo",
            s2: "bar"
        };
    }
}