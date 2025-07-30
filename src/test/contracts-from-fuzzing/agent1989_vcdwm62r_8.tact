struct Combo {
    i1: Int;
    txt: String;
    addr: Address;
    flag: Bool;
}

contract MultiTypeState {
    comboData: Combo;

    init() {
        self.comboData = Combo{
            i1: 5,
            txt: "test",
            addr: myAddress(),
            flag: true,
        };
    }
}