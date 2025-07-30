struct Level2 {
    value: Int;
}

struct Level1 {
    inner: Level2;
}

contract DeepAssign {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                value: 77
            }
        };
    }
}
