struct Level3 {
    s: String?;
}

struct Level2 {
    l3: Level3?
}

struct Level1 {
    l2: Level2?
}

contract DeepOptionalsTest {
    d: Level1;

    init() {
        self.d = Level1{
            l2: Level2{
                l3: Level3{ s:null },
            },
        };
    }

    receive() {
        let _ = self.d;
    }
}
