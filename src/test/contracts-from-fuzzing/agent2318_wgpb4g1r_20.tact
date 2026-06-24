struct OptionalDeepMulti {
    a: Int?;
    b: LevelA?;
}

struct LevelA {
    c: LevelB?;
}

struct LevelB {
    d: LevelC?;
}

struct LevelC {
    x: Int;
    s: String;
    f: Bool;
}

contract TestContract {
    data: OptionalDeepMulti = OptionalDeepMulti{
        a:null,
        b:null
    };

    init() {
        self.data = OptionalDeepMulti{
            a:5,
            b: LevelA{
                c: LevelB{
                    d: LevelC{
                        x:10,
                        s:"hi",
                        f:true
                    }
                }
            }
        };
    }
}
