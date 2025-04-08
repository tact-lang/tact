struct Alpha { a: Int; }
struct Beta { b: Bool; }
struct Gamma { c: String; }
struct Delta { d: Cell; }
struct Epsilon { e: Address; }

struct Combo {
    alpha: Alpha;
    beta: Beta;
    gamma: Gamma;
    delta: Delta;
    epsilon: Epsilon;
}

contract StructsNestedDifferent {
    storage: Combo;

    init() {
        self.storage = Combo{
            alpha: Alpha{a: 5},
            beta: Beta{b: true},
            gamma: Gamma{c: "hi"},
            delta: Delta{d: emptyCell()},
            epsilon: Epsilon{e: myAddress()}
        };
    }
}