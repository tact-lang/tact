struct DeepNested {
    foo: Int;
    bar: BarStruct;
}

struct BarStruct {
    baz: BazStruct;
}

struct BazStruct {
    qux: Int?;
}

contract Test {
    d: DeepNested;
    init() {
        self.d = DeepNested{
            foo:10,
            bar: BarStruct{
                baz: BazStruct{
                    qux: null
                }
            }
        };
    }
}