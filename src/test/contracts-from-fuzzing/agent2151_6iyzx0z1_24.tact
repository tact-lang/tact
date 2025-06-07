struct DeeplyNested {
    a: Int;
    b: Int?;
    c: Int;
}

struct Lvl2 {
    dn: DeeplyNested;
    x: Int;
}

struct Lvl1 {
    l2: Lvl2;
    y: Int?;
}

contract NestedLevels {
    info: Lvl1;

    init() {
        self.info = Lvl1{
            l2: Lvl2{
                dn: DeeplyNested{a:1, b:null, c:3},
                x:5
            },
            y:null
        };
    }
}