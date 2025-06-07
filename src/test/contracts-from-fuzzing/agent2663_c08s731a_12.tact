struct NestedStruct {
    value: Int;
    child: ChildStruct;
}

struct ChildStruct {
    flag: Bool;
    grandChild: GrandChildStruct;
}

struct GrandChildStruct {
    label: String;
    optInt: Int?;
}

contract ChildedStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            value: 42,
            child: ChildStruct{
                flag: true,
                grandChild: GrandChildStruct{
                    label: "grand",
                    optInt: null
                }
            }
        };
    }
}