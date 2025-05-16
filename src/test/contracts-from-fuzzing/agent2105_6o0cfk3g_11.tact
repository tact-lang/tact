struct OptionalDeep {
    inner: Level1?;
}

struct Level1 {
    inner: Level2?;
}

struct Level2 {
    inner: Level3?;
}

struct Level3 {
    x: Int?;
}

contract TestContract {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{
            inner: Level1{
                inner: Level2{
                    inner: Level3{
                        x: null
                    }
                }
            }
        };
    }
}