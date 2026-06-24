struct DeepNestedStruct {
    a: Int;
    b: StructLevel1;
}

struct StructLevel1 {
    c: Int;
    d: StructLevel2;
}

struct StructLevel2 {
    e: Int;
    f: StructLevel3;
}

struct StructLevel3 {
    g: Int;
    h: String;
    i: Bool;
}

contract TestContract {
    field: DeepNestedStruct;

    init() {
        self.field = DeepNestedStruct{
            a: 1,
            b: StructLevel1{
                c: 2,
                d: StructLevel2{
                    e: 3,
                    f: StructLevel3{
                        g: 4,
                        h: "hello",
                        i: true
                    }
                }
            }
        };
    }
}