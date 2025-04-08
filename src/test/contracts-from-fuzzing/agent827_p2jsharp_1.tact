struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    point: InnerStruct;
    label: String;
    optionalScore: Int?;
}

contract NestedStructContract {
    data: OuterStruct = OuterStruct{
        point: InnerStruct{x: 1, y: 2},
        label: "test",
        optionalScore: null
    };

    receive() {
        self.data = OuterStruct{
            point: InnerStruct{x: 3, y: 4},
            label: "done",
            optionalScore: 42
        };
    }
}