struct Details {
    id: Int;
    info: String;
}

struct Record {
    details: Details?;
    flag: Bool;
}

contract OptTuple {
    rec: Record;

    init() {
        self.rec = Record{
            details: null,
            flag: true
        };
    }
}