struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

struct Container {
    a: Int;
    b: Level1;
}

contract DeepNest {
    persist: Container = Container{
        a: 7,
        b: Level1{
            l2: Level2{
                l3: Level3{
                    val: 99
                }
            }
        }
    };

    init() {
        self.persist = Container{
            a: 42,
            b: Level1{
                l2: Level2{
                    l3: Level3{
                        val: 123
                    }
                }
            }
        };
    }
}
