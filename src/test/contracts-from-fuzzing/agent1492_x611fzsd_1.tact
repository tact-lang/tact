struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    x: InnerStruct;
    y: Int?;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            x: InnerStruct{a: 1, b: true},
            y: null,
        };
    }
}