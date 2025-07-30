struct Combo {
    x: Int as uint16;
    flag: Bool?;
    name: String;
    details: Slice;
    addr: Address;
}

contract ComboStructTest {
    comboData: Combo;

    init() {
        self.comboData = Combo{
            x: 1000,
            flag: null,
            name: "Mix",
            details: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}