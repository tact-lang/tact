struct Info {
    addr: Address;
    bl: Bool;
    num: Int;
    s: String;
}

contract InfoContract {
    meta: Info;

    init() {
        self.meta = Info{
            addr: myAddress(),
            bl: true,
            num: 123,
            s: "meta"
        };
    }
}