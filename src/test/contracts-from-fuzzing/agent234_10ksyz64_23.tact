struct OptionalStr {
    s: String?;
}

contract OptStrTest {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{
            s: "Hello"
        };
    }
}