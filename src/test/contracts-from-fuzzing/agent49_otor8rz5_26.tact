struct Mixed {
    value: Int as uint32;
    note: String;
    addr: Address;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            value: 1024,
            note: "Test note",
            addr: myAddress(),
        };
    }
}
