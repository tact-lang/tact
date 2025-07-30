struct Lvl3 {
    k: Int;
    m: Bool?;
}

struct Lvl2 {
    i: Int;
    j: Lvl3;
}

struct Lvl1 {
    a: Lvl2;
    b: Int?;
}

contract TestContract {
    val: Lvl1;

    init() {
        self.val = Lvl1{
            a: Lvl2{
                i: 10,
                j: Lvl3 {
                    k: 99,
                    m: true
                }
            },
            b: null
        };
    }
}