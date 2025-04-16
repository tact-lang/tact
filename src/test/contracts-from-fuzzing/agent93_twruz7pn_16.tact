struct LargeRecord {
    id: Int;
    name: String;
    comment: String?;
    verified: Bool;
    age: Int?;
    addr: Address?;
    tag: String;
    valid: Bool?;
    email: String?;
    phone: String?;
}

contract BigStructStore {
    big: LargeRecord;

    init() {
        self.big = LargeRecord{
            id: 42,
            name: "test",
            comment: null,
            verified: true,
            age: 30,
            addr: myAddress(),
            tag: "alpha",
            valid: true,
            email: "a@b.c",
            phone: null,
        };
    }
}