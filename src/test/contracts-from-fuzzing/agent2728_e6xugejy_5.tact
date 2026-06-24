struct Lvl3 {
    d: Int?;
    e: String;
}

struct Lvl2 {
    c: Bool;
    nested3: Lvl3;
}

struct Lvl1 {
    a: Int;
    b: Lvl2;
}

contract Test {
    root: Lvl1;

    init() {
        self.root = Lvl1{
            a: 1,
            b: Lvl2{
                c: true,
                nested3: Lvl3{
                    d: null,
                    e: "hi"
                }
            }
        };
    }
}
