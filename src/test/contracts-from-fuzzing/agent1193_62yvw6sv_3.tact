struct OptNested {
    num: Int?;
    flg: Bool?;
    txt: String?;
}

contract OptionalEdgeCase {
    data: OptNested;

    init() {
        self.data = OptNested{
            num: null,
            flg: true,
            txt: null,
        };
    }
}