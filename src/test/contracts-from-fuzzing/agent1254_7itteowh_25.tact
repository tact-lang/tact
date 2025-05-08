struct Lvl3 {
    f: Int;
}
struct Lvl2 {
    e: Int;
    l3: Lvl3;
}
struct Lvl1 {
    d: Int;
    l2: Lvl2;
}
contract CrossInlinedAssign {
    store: Lvl1;
    init() {
        self.store = Lvl1{
            d: 5,
            l2: Lvl2{
                e: 6,
                l3: Lvl3{
                    f: 7,
                },
            },
        };
    }
}