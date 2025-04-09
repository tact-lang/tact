struct DeepSliceNest {
    a: Slice;
}

struct Level2 {
    l2: DeepSliceNest;
    x: Int;
}

struct Level1 {
    l1: Level2;
    y: Bool;
}

contract DeepSliceContract {
    s: Level1;

    init() {
        self.s = Level1{
            l1: Level2{
                l2: DeepSliceNest{ a:emptyCell().asSlice() },
                x: 17
            },
            y: true
        };
    }
}
