struct ChainNulls {
    a: Level1?;
}

struct Level1 {
    b: Level2?;
}

struct Level2 {
    c: Level3?;
}

struct Level3 {
    d: Bool?;
}

contract ChainNullsTest {
    data: ChainNulls;

    init() {
        self.data = ChainNulls{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: null
                    }
                }
            }
        };
    }
}
