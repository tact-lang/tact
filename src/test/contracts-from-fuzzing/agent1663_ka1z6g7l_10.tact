struct NestedDeep {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Level4;
}

struct Level4 {
    val: Int;
}

contract DeepDeep {
    data: NestedDeep;

    init() {
        self.data = NestedDeep{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: Level4{
                            val: 999
                        }
                    }
                }
            }
        };
    }
}