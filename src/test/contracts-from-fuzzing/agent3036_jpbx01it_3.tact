struct DeepLevel3 {
    k: Int;
    m: Bool?;
}

struct DeepLevel2 {
    h: String;
    lvl3: DeepLevel3;
}

struct DeepLevel1 {
    a: Int;
    lvl2: DeepLevel2;
}

contract DeepNestedFields {
    data: DeepLevel1;

    init() {
        self.data = DeepLevel1{
            a: 10,
            lvl2: DeepLevel2{
                h: "test",
                lvl3: DeepLevel3{ k: 20, m: true }
            }
        };
    }
}
