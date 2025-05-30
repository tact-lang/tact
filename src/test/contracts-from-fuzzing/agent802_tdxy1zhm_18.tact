struct Lvl2 { a:Int; b:Int; }
struct Lvl1 { x:Lvl2; y:Lvl2; }

contract DefaultsNested {
    nested: Lvl1 = Lvl1{
        x: Lvl2{ a:1, b:2 },
        y: Lvl2{ a:3, b:4 },
    };

    init() {
        self.nested = Lvl1{
           x: Lvl2{ a:5, b:6 },
           y: Lvl2{ a:7, b:8 },
        };
    }
}