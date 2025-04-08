struct VeryDeep {
    layer: Level1;
}

struct Level1 {
    layer: Level2;
}

struct Level2 {
    layer: Level3;
}

struct Level3 {
    layer: Level4;
}

struct Level4 {
    layer: Level5;
}

struct Level5 {
    val: Int;
}

contract InsaneNesting {
    data: VeryDeep;

    init() {
        self.data = VeryDeep{
            layer: Level1{
                layer: Level2{
                    layer: Level3{
                        layer: Level4{
                            layer: Level5{
                                val: 777,
                            }
                        }
                    }
                }
            }
        };
    }
}