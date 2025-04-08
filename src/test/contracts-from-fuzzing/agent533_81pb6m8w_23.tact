struct StringOptions {
    s1: String?;
    s2: String;
}

contract Test {
    data: StringOptions;

    init() {
        self.data = StringOptions{
            s1: null,
            s2: "abc"
        };
    }
}