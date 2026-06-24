// Optional nested struct with nested optional inside
struct Lvl2 {
    a: Int?;
}

struct Lvl1 {
    nested: Lvl2?;
}

contract DoubleOptionalNest {
    persist: Lvl1;

    init() {
        self.persist = Lvl1{
            nested: null
        };
    }
}
