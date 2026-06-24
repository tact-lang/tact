struct A { f: Int; }
struct B { g: Int; h: A; }
struct C { i: B; j: A; }

contract DeepCombo {
    val: C;

    init() {
        self.val = C{
            i: B{ g: 1, h: A{ f: 2 } },
            j: A{ f: 3 }
        };
    }
}