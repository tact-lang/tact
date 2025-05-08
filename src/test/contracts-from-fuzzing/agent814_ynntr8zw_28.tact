// struct with multiple nested optionals and defaults inside nested structs
struct LevelA {
    optB: LevelB?;
    k: Int?;
}

struct LevelB {
    optC: LevelC?;
    bval: Bool = false;
}

struct LevelC {
    sval: String?;
    ival: Int = 100;
}

contract CrazyNest {
    root: LevelA;

    init() {
        self.root = LevelA{
            optB: LevelB{
                optC: LevelC{
                    sval: null,
                    ival: 200
                },
                bval: true
            },
            k: 77
        };
    }
}
