struct Tiny1 { x: Int }
struct Tiny2 { y: Bool }
struct Tiny3 { z: String }

struct TinyCombo {
    t1: Tiny1;
    t2: Tiny2;
    t3: Tiny3;
}

contract ManyTinyStructs {
    data: TinyCombo;

    init() {
        self.data = TinyCombo{
            t1: Tiny1{x: 5},
            t2: Tiny2{y: true},
            t3: Tiny3{z: "ok"},
        };
    }
}