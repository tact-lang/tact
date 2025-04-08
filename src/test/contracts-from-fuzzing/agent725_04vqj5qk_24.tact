struct BigNested {
    s: SmallNested;
}

struct SmallNested {
    v: InnerStruct2;
}

struct InnerStruct2 {
    x: Int;
    y: Bool;
}

contract BigNestedContract {
    value: BigNested;

    init() {
        self.value = BigNested{
            s: SmallNested{
                v: InnerStruct2{
                    x: 99,
                    y: true
                }
            }
        };
    }
}