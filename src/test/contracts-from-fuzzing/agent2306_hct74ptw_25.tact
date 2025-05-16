struct DeepNested2 {
    a: Int?; 
    b: Int;
    c: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalInsideStruct {
    nested: DeepNested2;

    init() {
        self.nested = DeepNested2 {
            a: null, b: 42, c: null
        };
    }
}
