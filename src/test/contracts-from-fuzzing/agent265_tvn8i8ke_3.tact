struct DeepLevel3 {
    foo: Int;
}

struct DeepLevel2 {
    nested3: DeepLevel3;
}

struct DeepLevel1 {
    nested2: DeepLevel2;
}

contract Test {
    data: DeepLevel1;

    init() {
        self.data = DeepLevel1{
            nested2: DeepLevel2{
                nested3: DeepLevel3{
                    foo: 42,
                },
            },
        };
    }
}