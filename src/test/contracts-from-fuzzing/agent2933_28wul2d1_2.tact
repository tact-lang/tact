struct DeepLevel3 {
    val: Bool;
}

struct DeepLevel2 {
    mid: DeepLevel3;
}

struct DeepLevel1 {
    nested: DeepLevel2;
}

contract DeepNested {
    store: DeepLevel1;

    init() {
        self.store = DeepLevel1{
            nested: DeepLevel2{
                mid: DeepLevel3{ val: true },
            },
        };
    }
}