struct Lvl3 {
    d: String;
    e: Bool;
}

struct Lvl2 {
    c: Int;
    inner2: Lvl3;
}

struct Lvl1 {
    a: Int;
    b: Lvl2;
}

contract DeepNestedTest {
    data: Lvl1;

    init() {
        self.data = Lvl1 {
            a: 10,
            b: Lvl2 {
                c: 20,
                inner2: Lvl3 {
                    d: "deep",
                    e: false
                }
            }
        };
    }
}