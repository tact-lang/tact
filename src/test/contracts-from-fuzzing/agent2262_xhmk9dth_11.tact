struct Detail {
    small: Int as uint4;
    text: String;
}

contract Test {
    info: Detail;

    init() {
        self.info = Detail{
            small: 6,
            text: "test"
        };
    }
}