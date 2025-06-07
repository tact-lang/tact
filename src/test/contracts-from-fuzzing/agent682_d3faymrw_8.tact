struct LevelC {
    x: Int;
}

struct LevelB {
    c: LevelC;
    f: Bool?;
}

struct LevelA {
    b: LevelB;
    s: String;
}

contract TestContract {
    d: LevelA;

    init() {
        self.d = LevelA{
            b: LevelB{
                c: LevelC{x: -77},
                f: null
            },
            s: "deep"
        };
    }
}