struct ExtraDeep {
    a: Int;
    b: LevelB;
}

struct LevelB {
    c: Bool;
    d: LevelC;
}

struct LevelC {
    e: String;
    f: LevelD;
}

struct LevelD {
    g: Int;
    h: Bool;
}

contract VeryDeep {
    val: ExtraDeep;
    
    init() {
        self.val = ExtraDeep{
            a:1,
            b: LevelB{
                c:true,
                d: LevelC{
                    e:"deep",
                    f: LevelD{ g:99, h:false }
                }
            }
        };
    }
}