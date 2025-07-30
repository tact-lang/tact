struct Detail {
    extra: Int?;
    note: String?;
}

struct Record {
    id: Int;
    flag: Bool;
    metadata: Detail?;
}

contract TestContract {
    rec: Record;

    init() {
        self.rec = Record{
            id: 100,
            flag: false,
            metadata: null,
        };
    }
}