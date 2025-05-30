struct DeepNestLevel2 {
    d: Int;
    e: Bool;
}

struct DeepNestLevel1 {
    b: Bool;
    c: DeepNestLevel2;
}

contract DeepNestedFields {
    a: Int;
    nest1: DeepNestLevel1;

    init() {
        self.a = 5;
        self.nest1 = DeepNestLevel1{
            b: true,
            c: DeepNestLevel2{d: 3, e: false}
        };
    }
}