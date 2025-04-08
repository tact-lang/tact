struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    a: Int;
    b: Bool;
    nested: InnerStruct;
    c: String;
}

contract MultipleNestedFields {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            a: 1,
            b: false,
            nested: InnerStruct{x:10, y:20},
            c: "hello",
        };
    }
}