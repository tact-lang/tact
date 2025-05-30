struct DefaultOptional {
    flag: Bool?;
    num: Int?;
    addr: Address?;
    text: String?;
    cellx: Cell?;
}

contract Test {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{
            flag: null,
            num: null,
            addr: null,
            text: null,
            cellx: null,
        };
    }
}
