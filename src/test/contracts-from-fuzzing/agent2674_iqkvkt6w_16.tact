struct Layer1 {
    int1: Int;
    bool1: Bool;
    s1: String;
    nested: Layer2;
}

struct Layer2 {
    int2: Int;
    bool2: Bool;
    s2: String?;
    nested2: Layer3;
}

struct Layer3 {
    int3: Int;
    bool3: Bool;
    s3: String?;
}

contract DeepMixedNestedLayers {
    storage: Layer1;

    init() {
        self.storage = Layer1{
            int1: 1,
            bool1: true,
            s1: "one",
            nested: Layer2{
                int2: 2,
                bool2: false,
                s2: null,
                nested2: Layer3{
                    int3: 3,
                    bool3: true,
                    s3: null,
                },
            },
        };
    }
}