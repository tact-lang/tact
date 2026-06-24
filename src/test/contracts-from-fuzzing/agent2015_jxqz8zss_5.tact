struct InnerStruct {
    a: Int;
    b: Bool?;
    c: String;
}

struct MiddleStruct {
    x: Int;
    y: InnerStruct?;
}

contract DeepOptionalTest {
    data: MiddleStruct;

    init() {
        self.data = MiddleStruct{
            x: 10,
            y: InnerStruct{ a: 1, b: null, c: "x" }
        };
    }
}