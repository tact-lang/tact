struct Level3 { c: Int; d: Bool; }

struct Level2 { a: Int; b: Level3; }

struct Level1 { 
    foo: Bool;
    bar: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            foo: false,
            bar: Level2{
                a: 10,
                b: Level3{
                    c: 5,
                    d: true
                }
            }
        };
    }
}
