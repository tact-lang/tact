struct DeepLevel3 {
    val: Int;
    flag: Bool;
}

struct DeepLevel2 {
    lvl3: DeepLevel3;
    amount: Int?;
}

struct DeepLevel1 {
    lvl2: DeepLevel2;
    comment: String;
}

contract NestedContract {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{
            lvl2: DeepLevel2{
                lvl3: DeepLevel3{ val: 1, flag: true },
                amount: null,
            },
            comment: "Test",
        };
    }
}