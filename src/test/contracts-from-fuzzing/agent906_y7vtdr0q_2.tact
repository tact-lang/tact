struct DeepLevel3 {
    a: Int;
}

struct DeepLevel2 {
    b: DeepLevel3;
}

struct DeepLevel1 {
    c: DeepLevel2;
}

contract DeepContract {
    deepData: DeepLevel1;

    init() {
        self.deepData = DeepLevel1{
            c: DeepLevel2{
                b: DeepLevel3{
                    a: 42,
                },
            },
        };
    }
}