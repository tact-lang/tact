struct Nested1 {
    x: Int?;
}

struct Nested2 {
    y: Bool;
    nested1: Nested1;
}

struct Nested3 {
    z: String;
    nested2: Nested2;
}

contract StorageDeep {
    nested3: Nested3;

    init() {
        self.nested3 = Nested3{
            z: "test",
            nested2: Nested2{
                y: false,
                nested1: Nested1{
                    x: null,
                },
            },
        };
    }
}