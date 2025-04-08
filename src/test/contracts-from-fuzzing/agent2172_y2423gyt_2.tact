struct MidStruct {
    x: Int;
    y: String;
    flag: Bool?;
}

struct OuterStruct {
    param: Int?;
    nested: MidStruct;
}

contract NestedOptionals {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            param: null,
            nested: MidStruct{
                x: 1,
                y: "hi",
                flag: true,
            }
        };
    }
}
