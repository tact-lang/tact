struct OptionalDeep {
    num: Int?;
    text: String?;
    addr: Address?;
    cellData: Cell?;
    flag: Bool?;
}

contract OptionalStorage {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            num: null,
            text: null,
            addr: null,
            cellData: null,
            flag: null
        };
    }
}