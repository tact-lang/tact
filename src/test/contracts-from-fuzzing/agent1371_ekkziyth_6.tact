struct Level3 {
    val1: Int;
    val2: Bool;
    val3: Slice?;
}

struct Level2 {
    nested1: Level3;
    nested2: Level3;
}

struct Level1 {
    nested: Level2;
}

contract MultibranchNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested1: Level3{val1:1, val2:true, val3:null},
                nested2: Level3{val1:2, val2:false, val3:null}
            }
        };
    }
}