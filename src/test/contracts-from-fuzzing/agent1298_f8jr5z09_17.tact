struct A { a: Int }
struct B { b: Int }

struct Combo {
    first: A;
    second: B;
    optA: A?;
    optB: B?;
}

contract ComboTest {
    combo: Combo;
    init() {
        self.combo = Combo{
            first: A{a:1},
            second: B{b:2},
            optA: null,
            optB: null
        };
    }
}