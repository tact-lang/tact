struct LargeRecord {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    flag: Bool = false;
    note: String = "note";
}

contract BigStructStorage {
    rec: LargeRecord;

    init() {
        self.rec = LargeRecord{
            a: 5,
            b: true,
            c: "hello",
            d: myAddress()
        };
    }
}