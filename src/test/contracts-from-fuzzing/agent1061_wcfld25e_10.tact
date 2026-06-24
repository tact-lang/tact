// optional optional not allowed, but optional primitive deeply nested should be ok
struct Lvl3 { val: Int?; }
struct Lvl2 { nest: Lvl3; }
struct Lvl1 { nest: Lvl2; }

contract Test {
    data: Lvl1;

    init() {
        self.data = Lvl1{
            nest: Lvl2{
                nest: Lvl3{ val: null }
            }
        };
    }
}