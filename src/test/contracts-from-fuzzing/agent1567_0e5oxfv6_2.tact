struct DeepLevel2 {
    x: Int;
    y: Bool;
}

struct DeepLevel1 {
    a: DeepLevel2;
    b: Int;
}

struct DeepRoot {
    root: DeepLevel1;
    flag: Bool;
}

contract NestedContract {
    storage: DeepRoot;

    init() {
        self.storage = DeepRoot{
            root: DeepLevel1{
                a: DeepLevel2{
                    x: 123,
                    y: false,
                },
                b: 456,
            },
            flag: true,
        };
    }
}