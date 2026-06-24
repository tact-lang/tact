struct Level3 {
    name: String?;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract TripleNestedOptional {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    name: null
                }
            }
        };
    }
}