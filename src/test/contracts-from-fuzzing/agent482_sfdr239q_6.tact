struct Info {
    a: Int;
    b: String?;
    c: Bool?;
}

contract NestedStructTest {
    info: Info;

    init() {
        self.info = Info{
            a: 101,
            b: "hi",
            c: null,
        };
    }
}
