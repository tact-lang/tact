struct NestedStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
}

struct OuterStruct {
    nested: NestedStruct;
    e: Int;
    f: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: NestedStruct{
                a: 1,
                b: null,
                c: true,
                d: "Test"
            },
            e: 5,
            f: false
        };
    }
}