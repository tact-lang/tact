struct AddrFlags {
    addr: Address;
    flag: Bool;
    comment: String;
}

contract MultiType {
    data: AddrFlags;

    init() {
        self.data = AddrFlags{
            addr: myAddress(),
            flag: true,
            comment: "hello",
        };
    }
}
