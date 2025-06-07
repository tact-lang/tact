struct DeepLevel3 {
    d: Int;
    e: Bool;
}

struct DeepLevel2 {
    c: String;
    lvl3: DeepLevel3;
}

struct DeepLevel1 {
    a: Int;
    b: DeepLevel2;
}

contract DeepNestedStructStorage {
    all: DeepLevel1;

    init() {
        self.all = DeepLevel1{
            a: 1,
            b: DeepLevel2{
                c: "hi",
                lvl3: DeepLevel3{d: 5, e: false},
            }
        };
    }
}