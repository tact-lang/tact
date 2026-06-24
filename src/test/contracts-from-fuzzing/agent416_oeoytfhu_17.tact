struct Lvl1 {
    a: Int;
}
struct Lvl2 {
    inner: Lvl1;
}
struct Lvl3 {
    deep: Lvl2;
}

contract Test17 {
    s: Lvl3;

    init() {
        self.s = Lvl3{
            deep: Lvl2{
                inner: Lvl1{ a: 30 }
            }
        };
    }
}
