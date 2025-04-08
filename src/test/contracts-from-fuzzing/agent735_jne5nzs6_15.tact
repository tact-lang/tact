struct InnerFlags {
    enabled: Bool;
    comment: String?;
}

struct Diverse {
    addr: Address;
    amount: Int as coins;
    count: Int as uint16;
    note: String?;
    flags: InnerFlags?;
}

contract DiverseStorage {
    data: Diverse;

    init() {
        self.data = Diverse{
            addr: myAddress(),
            amount: 1000000000,
            count: 42,
            note: null,
            flags: InnerFlags{
                enabled: true,
                comment: "foo",
            },
        };
    }
}
