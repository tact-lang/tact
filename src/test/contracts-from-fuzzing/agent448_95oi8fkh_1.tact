struct InnerStruct {
    x: Int;
    y: Int?;
}

struct OuterStruct {
    a: Int;
    b: Bool;
    c: InnerStruct;
}

contract NestedStructContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            a: 1,
            b: true,
            c: InnerStruct{
                x: 10,
                y: null,
            },
        };
    }

    receive() {}
}