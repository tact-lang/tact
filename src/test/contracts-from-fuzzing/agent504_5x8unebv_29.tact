struct InnerMost {
    val: Int;
}

struct Level2 {
    inner: InnerMost;
}

struct Level3 {
    inner: Level2;
}

struct Level4 {
    inner: Level3;
}

contract DeepFourNested {
    d: Level4;

    init() {
        self.d = Level4{
            inner: Level3{
                inner: Level2{
                    inner: InnerMost{ val: 55 }
                }
            }
        };
    }

    receive() {
        let _ = self.d;
    }
}