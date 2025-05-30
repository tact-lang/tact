struct Level4 { focus: Int; }

struct Level3 { deep: Level4; }

struct Level2 { more: Level3; }

struct Level1 { inner: Level2; }

contract DeepNest {
    d: Level1;

    init() {
        self.d = Level1{
            inner: Level2{
                more: Level3{
                    deep: Level4{
                        focus: 999
                    }
                }
            }
        };
    }

    receive() {
        self.d = self.d;
    }
}