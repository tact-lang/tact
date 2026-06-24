struct DeepLevel3 {
    k: Int;
    m: Bool;
}

struct DeepLevel2 {
    j: DeepLevel3;
    f: Bool?;
}

struct DeepLevel1 {
    i: DeepLevel2;
    h: Int?;
}

contract NestedDeepTest {
    s: DeepLevel1;

    init() {
        self.s = DeepLevel1{
            i: DeepLevel2{
                j: DeepLevel3{
                    k: 5,
                    m: true,
                },
                f: null,
            },
            h: null,
        };
    }
}