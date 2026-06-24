struct Strings {
    s1: String = "hello";
    s2: String = "world";
    s3: String?;
}

contract TestContract {
    data: Strings;

    init() {
        self.data = Strings{
            s1: "foo",
            s2: "bar",
            s3: null
        };
    }
}