struct Level1 { 
    a: Int;
}

struct Level2 {
    inner: Level1;
    b: String;
}

struct Level3 {
    inner: Level2;
    c: Bool?;
}

contract NestedLevels {
    data: Level3;

    init() {
        self.data = Level3{
            inner: Level2{
                inner: Level1{
                    a: 42
                },
                b: "data"
            },
            c: true
        };
    }
}