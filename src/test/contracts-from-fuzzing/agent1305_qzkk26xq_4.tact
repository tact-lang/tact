struct OptionalStruct {
    num: Int?;
    flag: Bool?;
    str: String?;
    addr: Address?;
    cellData: Cell?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            num: null,
            flag: null,
            str: null,
            addr: null,
            cellData: null,
        };
    }
}