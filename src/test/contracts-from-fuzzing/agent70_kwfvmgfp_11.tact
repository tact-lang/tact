struct Mixed {
    txt: String;
    addr: Address;
    num: Int;
    flag: Bool;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            txt: "hello",
            addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            num: 123,
            flag: true
        };
    }

    receive() {
        self.data = Mixed{
            txt: "bye",
            addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            num: 456,
            flag: false
        };
    }
}