struct Level3 {
    g: Int?;
    h: Int;
}

struct Level2 {
    e: Bool;
    f: Level3?;
}

struct Level1 {
    a: Int;
    b: String;
    c: Bool?;
    d: Level2;
}

contract NestedMix {
    info: Level1;

    init() {
        self.info = Level1{
            a:42,
            b:"hello",
            c:null,
            d: Level2{
                e:true,
                f:null
            }
        };
    }
}
