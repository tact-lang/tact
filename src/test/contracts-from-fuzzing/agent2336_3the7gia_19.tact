struct Wrap {
    str: String;
    addr: Address;
    num: Int;
    flag: Bool;
}

contract Test {
    field: Wrap;

    init() {
        self.field = Wrap{ str: "hi", addr: myAddress(), num: 5, flag: true };
    }
}