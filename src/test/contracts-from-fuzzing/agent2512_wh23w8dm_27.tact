struct LevelA {
    a: Int;
    next: LevelB;
}
struct LevelB {
    b: Int;
    next: LevelC;
}
struct LevelC {
    c: Int;
    next: LevelD;
}
struct LevelD {
    d: Int;
}

contract DeepPointerChain {
    ref: LevelA;

    init() {
        self.ref = LevelA{
            a:1, next: LevelB{
                b:2, next: LevelC{
                    c:3, next: LevelD{d:4}
                }
            }
        };
    }
}