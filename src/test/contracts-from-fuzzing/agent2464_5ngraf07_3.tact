struct NestedStruct {
    inner: Level1;
}

struct Level1 {
    sub: Level2;
}

struct Level2 {
    val: Int;
    optionalStr: String?;
}

contract DeepNest {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{
            inner: Level1{
                sub: Level2{
                    val: 123,
                    optionalStr: "test"
                }
            }
        };
    }
}
