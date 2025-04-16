struct ContainsString {
    s1: String;
    s2: String?;
}

contract StringTest {
    data: ContainsString;

    init() {
        self.data = ContainsString{
            s1: "hello",
            s2: null,
        };
    }
}