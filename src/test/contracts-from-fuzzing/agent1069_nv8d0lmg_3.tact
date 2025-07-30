struct DeeplyNested {
    level: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: Bool?;
}

contract ManyNestings {
    stored: DeeplyNested;

    init() {
        self.stored = DeeplyNested{
            level: 1,
            inner: InnerStruct{foo: 10, bar: true}
        };
    }
}