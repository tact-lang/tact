struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    p1: InnerStruct;
    p2: InnerStruct;
    str: String;
    b: Bool;
}

contract ManyNestedStructs {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            p1: InnerStruct{ x: 1, y: 2 },
            p2: InnerStruct{ x: 3, y: 4 },
            str: "hello",
            b: true
        };
    }
}