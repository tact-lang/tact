struct DeepNested {
    inner: StructLevel1;
}

struct StructLevel1 {
    lvl2: StructLevel2;
}

struct StructLevel2 {
    lvl3: StructLevel3?;
}

struct StructLevel3 {
    field: Int?;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: StructLevel1{
                lvl2: StructLevel2{
                    lvl3: StructLevel3{
                        field: null
                    }
                }
            }
        };
    }
}