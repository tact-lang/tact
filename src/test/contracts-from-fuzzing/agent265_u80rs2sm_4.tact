struct MultiLevel {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    nested: DeeperStruct;
}

struct DeeperStruct {
    value: Int;
    text: String;
    cellVal: Cell;
}

contract MultiLevelStore {
    store: MultiLevel;

    init() {
        self.store = MultiLevel{
            inner: InnerStruct{
                flag: false,
                nested: DeeperStruct{
                    value: 123,
                    text: "Deep",
                    cellVal: emptyCell(),
                },
            },
        };
    }

    receive() {
        self.store = self.store;
    }
}