contract TestDeeplyNested {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            inner: InnerStruct{
                opt1: 123,
                innerMost: InnerMostStruct{
                    flag: true,
                    text: "hello"
                }
            }
        };
    }
}

struct OuterStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    opt1: Int?;
    innerMost: InnerMostStruct;
}

struct InnerMostStruct {
    flag: Bool;
    text: String;
}
