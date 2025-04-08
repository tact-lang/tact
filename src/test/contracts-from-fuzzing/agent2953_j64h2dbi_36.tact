struct LevelA {
    a: Int;
    opt: Int?;
}

struct LevelB {
    la: LevelA?;
}

contract BottomOptionals {
    field: LevelB;

    init() {
        self.field = LevelB{
            la: LevelA{
                a: 2,
                opt: null
            }
        };
    }
}