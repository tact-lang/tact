struct Inner {
    value: Int;
    flag: Bool;
    text: String?;
}

contract MultiFieldStructTest {
    data: Inner;

    init() {
        self.data = Inner{
            value: 42,
            flag: true,
            text: "ok"
        };
    }
}