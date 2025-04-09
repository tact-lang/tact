struct DeepNested {
    inner: StructA;
}

struct StructA {
    inner2: StructB;
}

struct StructB {
    val: Int;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            inner: StructA{
                inner2: StructB{ val: 123 }
            }
        };
    }
}