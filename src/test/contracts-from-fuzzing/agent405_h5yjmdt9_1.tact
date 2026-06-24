struct DeepNested {
    x: Int;
    y: Int?;
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: Int?;
}

contract NestTest {
    data: DeepNested = DeepNested{
        x: 1,
        y: null,
        inner: InnerStruct{
            foo: 2,
            bar: null,
        },
    };
 
    init() {
        self.data = DeepNested{
            x: 10,
            y: null,
            inner: InnerStruct{ foo: 20, bar: null },
        };
    }
}