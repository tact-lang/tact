struct DeepNested {
    s1: StructLevel1;
    s2: StructLevel2;
}

struct StructLevel1 {
    innerVal: Int;
    optionalInner: Bool?;
}

struct StructLevel2 {
    nested: StructLevel1;
    val: Int;
}

contract DeepNestTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            s1: StructLevel1{ innerVal: 42, optionalInner: null },
            s2: StructLevel2{ nested: StructLevel1{ innerVal: 10, optionalInner: true }, val: 5 }
        };
    }
}