struct BigNested {
    s: String;
    b: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    nested: DeepStruct;
}

struct DeepStruct {
    y: Int?;
    z: String;
}

contract BigNestedTest {
    data: BigNested;

    init() {
        self.data = BigNested{
            s: "test",
            b: true,
            inner: InnerStruct{
                x: 10,
                nested: DeepStruct{
                    y: null,
                    z: "deep"
                }
            }
        };
    }
}
