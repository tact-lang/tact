struct Level3 {
    val: Int;
    comment: String;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    foo: Level2;
    optionalStr: String?;
}

contract NestedOptMix {
    data: Level1;
    
    init() {
        self.data = Level1{
            foo: Level2{
                nested: Level3{
                    val: 42,
                    comment: "test"
                },
                flag: true
            },
            optionalStr: null
        };
    }
}
