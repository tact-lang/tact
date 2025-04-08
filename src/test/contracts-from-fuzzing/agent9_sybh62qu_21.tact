struct Lvl1 {a:Int}
struct Lvl2 {a:Lvl1}
struct Lvl3 {a:Lvl2}
struct Lvl4 {a:Lvl3}

contract NullableTopDeep {
    v: Lvl4?;
    init() {
        self.v = Lvl4{
            a: Lvl3{
                a: Lvl2{
                    a: Lvl1{a:42}
                }
            }
        };
    }
}