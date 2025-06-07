struct DeepNested3 {
    val: Int;
}

struct DeepNested2 {
    d: DeepNested3;
}

struct DeepNested1 {
    c: DeepNested2;
}

contract DeepNestedStorage {
    data: DeepNested1;

    init() {
        self.data = DeepNested1{
            c: DeepNested2{ d: DeepNested3{ val: 256 } }
        };
    }
}
