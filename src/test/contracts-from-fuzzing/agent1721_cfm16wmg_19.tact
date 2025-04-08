struct OuterStruct {
    a: Int;
    b: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
    z: String;
}

contract NestOptTest {
    field: OuterStruct;
    init() {
        self.field = OuterStruct{
            a: 5,
            b: InnerStruct{
                x: 7,
                y: null,
                z: "deep"
            }
        };
    }
}