struct DeepLevel4 {
    w: Int;
}

struct DeepLevel3 {
    z: Bool;
    deep4: DeepLevel4;
}

struct DeepLevel2 {
    y: String;
    deep3: DeepLevel3;
}

struct DeepLevel1 {
    x: Int;
    deep2: DeepLevel2;
}

contract MaxDepthTest {
    val: DeepLevel1;

    init() {
        self.val = DeepLevel1{
            x: 10,
            deep2: DeepLevel2{
                y: "hi",
                deep3: DeepLevel3{
                    z: true,
                    deep4: DeepLevel4{
                        w: 42,
                    },
                },
            },
        };
    }
}