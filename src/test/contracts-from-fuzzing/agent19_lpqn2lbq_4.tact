struct C1 { x: Int }
struct C2 { c1: C1 }
struct C3 { c2: C2 }
struct C4 { c3: C3 }
struct C5 { c4: C4 }
struct C6 { c5: C5 }

contract TestContract {
    deep: C6;

    init() {
        self.deep = C6{ c5: C5{ c4: C4{ c3: C3{ c2: C2{ c1: C1{ x: 42 } } } } } };
    }
}