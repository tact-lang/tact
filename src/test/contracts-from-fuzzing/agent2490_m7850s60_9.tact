struct Nested1 {
    x: Int;
}

struct Nested2 {
    y: Nested1;
}

struct Nested3 {
    z: Nested2;
}

contract DeeplyNestedStruct {
    data: Nested3;

    init() {
        self.data = Nested3{
            z: Nested2{
                y: Nested1{x: 42},
            },
        };
    }
}