struct Mix {
    num: Int;
    flag: Bool;
    name: String;
    content: Cell;
    part: Slice;
    addr: Address;
}

contract TestContract {
    mixed: Mix;

    init() {
        self.mixed = Mix{
            num: 42,
            flag: true,
            name: "mix",
            content: emptyCell(),
            part: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}