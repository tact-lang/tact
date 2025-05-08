struct MixedBag {
    id: Int;
    name: String;
    flag: Bool;
    note: String?;
    amount: Int as uint64;
    large: Int;
    description: String = "desc";
}

contract HeteroStorage {
    persist: MixedBag;

    init() {
        self.persist = MixedBag{
            id: 77,
            name: "alpha",
            flag: true,
            note: null,
            amount: 123456,
            large: -999999
        };
    }
}