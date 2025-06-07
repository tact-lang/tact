struct DeepNested {
    val: Int;
}

struct MidNested {
    deep: DeepNested;
}

struct Outer {
    mid: MidNested;
}

contract TestContract {
    nested: Outer;
    
    init() {
        self.nested = Outer{
            mid: MidNested{
                deep: DeepNested{val: 42}
            }
        };
    }
}