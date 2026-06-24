struct DeepNested {
    nested1: Struct1;
}

struct Struct1 {
    nested2: Struct2;
}

struct Struct2 {
    nested3: Struct3;
}

struct Struct3 {
    val: Int;
}

contract Test {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            nested1: Struct1{
                nested2: Struct2{
                    nested3: Struct3{ val: 99 }
                }
            }
        };
    }
}