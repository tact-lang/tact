struct DeepLevel3 {
    v1: Int;
    v2: Bool;
    txt: String;
}

struct DeepLevel2 {
    dl3: DeepLevel3;
    extra: Int;
}

struct DeepLevel1 {
    dl2: DeepLevel2;
}

contract DeepNestingContract {
    root: DeepLevel1 = DeepLevel1{
        dl2: DeepLevel2{
            dl3: DeepLevel3{
                v1: 1000,
                v2: true,
                txt: "deep",
            },
            extra: 42,
        }
    };

    receive() {}
}