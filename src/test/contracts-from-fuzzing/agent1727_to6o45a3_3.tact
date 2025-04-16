struct OptionalWrap {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptStructContract {
    data: OptionalWrap = OptionalWrap{};

    receive() {
        self.data = OptionalWrap{
            s: "maybe",
            n: 123,
            b: true,
        };
    }
}