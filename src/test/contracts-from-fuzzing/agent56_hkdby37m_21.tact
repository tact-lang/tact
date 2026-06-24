struct Base1 { a: Int }
struct Base2 { b: Int }

struct Comb1 { c1: Base1 }
struct Comb2 { c2: Base2 }

struct Both {
    x: Comb1;
    y: Comb2;
}

contract MultiStructNested {
    both: Both;

    init() {
        self.both = Both{
            x: Comb1{ c1: Base1{ a: 1 } },
            y: Comb2{ c2: Base2{ b: 2 } }
        };
    }
}