struct Lvl3 { innerStr: String }
struct Lvl2 { next: Lvl3 }
struct Lvl1 { next: Lvl2 }
contract Nested3 {
    field: Lvl1;

    init() {
        self.field = Lvl1{
            next: Lvl2{
                next: Lvl3{ innerStr: "X" }
            }
        };
    }
}
