struct DeeplyNested {
    inner: StructLevel2;
}

struct StructLevel2 {
    nested: StructLevel3;
    b: Bool;
}

struct StructLevel3 {
    s: String;
    n: Int;
}

contract Test3 {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{
            inner: StructLevel2{
                nested: StructLevel3{s:"hello", n:1},
                b:true
            }
        };
    }
}