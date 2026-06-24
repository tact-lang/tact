struct D { valD: Int; }

struct B { valB: Int; d: D?; }

struct E { valE: Int; }

struct C { valC: Int; e: E?; }

struct A { valA: Int; b: B; c: C?; }

contract DeepNested {
    storage: A;

    init() {
        self.storage = A{
            valA: 1,
            b: B{ valB: 2, d: null },
            c: null
        };
    }
}