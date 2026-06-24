struct Wrapper {
    str: String;
    addr: Address;
    intv: Int;
    flag: Bool;
}

contract OptionalWrapper {
    data: Wrapper?;

    init() {
        self.data = Wrapper{
            str: "string",
            addr: myAddress(),
            intv: 42,
            flag: true
        };
    }
}