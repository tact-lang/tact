struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    deep: DeeperStruct;
}

struct DeeperStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;
    f: Int?;
    g: Bool?;
    h: Cell?;
    i: Address?;
    j: String?;
}

contract NestedContract {
    storage: NestedStruct;

    init() {
        self.storage = NestedStruct{
            inner: InnerStruct{
                deep: DeeperStruct{
                    a: 1,
                    b: true,
                    c: emptyCell(),
                    d: myAddress(),
                    e: "hi",
                    f: 123,
                    g: false,
                    h: emptyCell(),
                    i: myAddress(),
                    j: "test"
                }
            }
        };
    }
}