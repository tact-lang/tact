struct DeepNested {
    level: Int;
    next: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    info: LeafStruct;
}

struct LeafStruct {
    data: String;
    num: Int?;
}

contract Test {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            level: 1,
            next: InnerStruct{
                flag: true,
                info: LeafStruct{
                    data: "deep",
                    num: 42
                }
            }
        };
    }

    receive() {}
}