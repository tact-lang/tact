struct DeepOptional {
    nested: Level1?;
}

struct Level1 {
    inner: Level2?;
}

struct Level2 {
    flag: Bool?;
    val: Int?;
}

contract DeepOptionalTest {
    val: DeepOptional;

    init() {
        self.val = DeepOptional{
            nested: Level1{
                inner: Level2{flag:true, val:10}
            }
        };
    }
}