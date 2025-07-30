// test contract persistent fields with all nested 2-level structs, to stress nested store
struct Lvl2 {
    x: Int;
    y: Bool;
}
struct Lvl1 {
    a: Lvl2;
    b: Lvl2;
}

contract DeepStorage {
    store: Lvl1;
    init() {
        self.store = Lvl1{
            a: Lvl2{ x:1, y:true },
            b: Lvl2{ x:2, y:false }
        };
    }
}