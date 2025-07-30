struct Lvl3 {
    s: String;
    b: Bool;
}

struct Lvl2 {
    x: Int;
    inner: Lvl3;
}

struct Lvl1 {
    y: Int;
    child: Lvl2;
}

contract Test {
    root: Lvl1;

    init() {
        self.root = Lvl1{
            y: 55,
            child: Lvl2{
                x: 44,
                inner: Lvl3{
                    s: "abc",
                    b: true
                }
            }
        };
    }
}