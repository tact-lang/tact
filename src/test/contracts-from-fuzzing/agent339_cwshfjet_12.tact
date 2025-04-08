struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

struct Wrapper {
    w: Level1;
}

contract WrapperStore {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            w: Level1{
                l2: Level2{
                    l3: Level3{
                        a: 999
                    }
                }
            }
        };
    }
}