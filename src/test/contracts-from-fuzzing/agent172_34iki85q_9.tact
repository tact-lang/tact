struct InnerRecord {
    id: Int as uint32;
    name: String;
    flag: Bool;
    desc: String?;
}

struct Container {
    first: InnerRecord;
    second: InnerRecord;
}

contract TwoRecords {
    data: Container;

    init() {
        self.data = Container{
            first: InnerRecord{
                id: 1,
                name: "one",
                flag: true,
                desc: null,
            },
            second: InnerRecord{
                id: 2,
                name: "two",
                flag: false,
                desc: "second description",
            }
        };
    }
}