contract TestDeepNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{
                val1: 1,
                val2: InnerMost{
                    x: 2,
                    y: null,
                    z: 3
                }
            },
            val3: 123
        };
    }
}

struct OuterStruct {
    inner: InnerStruct;
    val3: Int;
}

struct InnerStruct {
    val1: Int;
    val2: InnerMost;
}

struct InnerMost {
    x: Int;
    y: String?;
    z: Int;
}
