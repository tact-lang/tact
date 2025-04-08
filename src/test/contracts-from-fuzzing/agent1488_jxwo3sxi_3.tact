struct DeepNested {
    txt: String;
    optInt: Int?;
    inner: InnerNested;
}

struct InnerNested {
    a: Int;
    b: Bool;
    optMostInner: MostInner?;
}

struct MostInner {
    x: Int;
    y: String;
}

contract DeepStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            txt: "hello",
            optInt: 42,
            inner: InnerNested{
                a: 1,
                b: true,
                optMostInner: MostInner{ x: 7, y: "deep" }
            }
        };
    }
}