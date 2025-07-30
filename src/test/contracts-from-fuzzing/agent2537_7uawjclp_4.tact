struct DeepLevel3 {
    value: Int;
    toggle: Bool;
}

struct DeepLevel2 {
    nested3: DeepLevel3;
    label: String;
}

struct DeepLevel1 {
    nested2: DeepLevel2;
    info: String;
}

contract DeepNestTest {
    storage: DeepLevel1;
    init() {
        self.storage = DeepLevel1{
            nested2: DeepLevel2{
                nested3: DeepLevel3{
                    value: 789,
                    toggle: true
                },
                label: "Inner level 2"
            },
            info: "Top level"
        };
    }
}