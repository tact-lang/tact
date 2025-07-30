struct Lvl3 {
    val3: Int;
}

struct Lvl2 {
    val2: Int;
    nested3: Lvl3;
}

struct Lvl1 {
    val1: Int;
    nested2: Lvl2;
}

contract TripleNest {
    nested: Lvl1;
    init() {
        self.nested = Lvl1{
            val1: 1,
            nested2: Lvl2{val2:2, nested3: Lvl3{val3:3}}
        };
    }
}