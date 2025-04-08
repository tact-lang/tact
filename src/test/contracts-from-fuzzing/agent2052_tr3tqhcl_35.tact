struct Level3 {
    val: String;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract AssignNestedStructs {
    s: Level1;

    init() {
        self.s = Level1{
            inner: Level2{
                inner: Level3{
                    val: "deepest"
                }
            }
        };
    }
}