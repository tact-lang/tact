struct LevelC {
    z: Int;
}

struct LevelB {
    y: LevelC;
}

struct LevelA {
    x: LevelB;
}

contract Chain3 {
    ptr: LevelA;

    init() {
        self.ptr = LevelA{
            x: LevelB{
                y: LevelC{z: 42}
            }
        };
    }
}