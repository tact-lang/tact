struct DeeplyNested {
    nested: Nested1;
}

struct Nested1 {
    nested: Nested2;
}

struct Nested2 {
    nested: Nested3;
}

struct Nested3 {
    nested: Nested4;
}

struct Nested4 {
    x: Int;
}

contract ComplexDeepNested {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            nested: Nested1{
                nested: Nested2{
                    nested: Nested3{
                        nested: Nested4{x:42}
                    }
                }
            }
        };
    }
}