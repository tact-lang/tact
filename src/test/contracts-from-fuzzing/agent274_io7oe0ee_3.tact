struct OptionNested {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptNestedTest {
    data: OptionNested;

    init() {
        self.data = OptionNested{
            x: null,
            y: true,
            z: null,
        };
    }

    receive() {}
}
