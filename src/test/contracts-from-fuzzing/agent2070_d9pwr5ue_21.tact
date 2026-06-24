struct LargeNested {
    a: Int;
    b: MidStruct;
}

struct MidStruct {
    x: Int;
    y: BottomStruct;
}

struct BottomStruct {
    value: Int?;
    text: String;
}

contract LargeNestedContract {
    storage: LargeNested;

    init() {
        self.storage = LargeNested{
            a: 7,
            b: MidStruct{
                x: 8,
                y: BottomStruct{
                    value: null,
                    text: "Deep"
                }
            }
        };
    }
}