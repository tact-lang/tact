struct Strings {
    s1: String;
    s2: String?;
    s3: String;
}

contract TestContract {
    data: Strings;

    init() {
        self.data = Strings{
            s1: "hello",
            s2: null,
            s3: "world",
        };
    }
}