struct A { x: Int; y: Bool; z: String }

struct B { m: Int?; n: Bool; o: String }

struct C { p: A; q: B; r: Int }

contract TestContract {
    s: C;

    init() {
        self.s = C{
            p: A{ x: 1, y: false, z: "alpha" },
            q: B{ m: null, n: true, o: "beta" },
            r: 42
        };
    }
}