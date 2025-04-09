struct Level3 {
    a: Int?;
    b: Bool?;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    text: String;
}

contract DeepNested {
    val: Level1;
    
    init() {
        self.val = Level1{
            nested: Level2{
                nested: Level3{
                    a: null,
                    b: null,
                },
                flag: true,
            },
            text: "test",
        };
    }

    receive() {}
}