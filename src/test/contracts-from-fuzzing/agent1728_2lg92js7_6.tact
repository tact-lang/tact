struct DeepLevel3 {
    gamma: Bool;
}

struct DeepLevel2 {
    beta: DeepLevel3;
    message: String;
}

struct DeepLevel1 {
    alpha: DeepLevel2;
    num: Int;
}

contract DeepNested {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{
            alpha: DeepLevel2{
                beta: DeepLevel3{
                    gamma: true,
                },
                message: "msg",
            },
            num: 123,
        };
    }
}