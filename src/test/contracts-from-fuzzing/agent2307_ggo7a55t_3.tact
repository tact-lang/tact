struct Innest {
    a: Int;
}

struct Level2 {
    inn: Innest?;
    b: Bool;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2?;
}

contract Combos {
    stuff: Level1;

    init() {
        self.stuff = Level1{
            l2a: Level2{
                inn: null,
                b: true
            },
            l2b: Level2{
                inn: Innest{a: 42},
                b: false
            }
        };
    }
}
