struct DeepLevel3 { flag: Bool }
struct DeepLevel2 { nested: DeepLevel3 }
struct DeepLevel1 { nested: DeepLevel2 }

contract DeeplyNestedStructs {
    root: DeepLevel1;

    init() {
        self.root = DeepLevel1{
            nested: DeepLevel2{
                nested: DeepLevel3{
                    flag: true,
                },
            },
        };
    }
}
