struct LevelD {
    sd: String;
    id: Int;
}

struct LevelC {
    sc: String;
    ic: Int;
    d: LevelD;
}

struct LevelB {
    sb: String;
    ib: Int;
    c: LevelC;
}

struct LevelA {
    sa: String;
    ia: Int;
    b: LevelB;
}

contract FourDeep {
    data: LevelA;

    init() {
        self.data = LevelA{
            sa: "A",
            ia: 1,
            b: LevelB{
                sb: "B",
                ib: 2,
                c: LevelC{
                    sc: "C",
                    ic: 3,
                    d: LevelD{
                        sd: "D",
                        id: 4,
                    },
                },
            },
        };
    }
}