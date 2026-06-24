struct First { x: Int; y: Int; }
struct Second { a: First; b: Int; }
struct Third { s: Second; z: Bool; }

contract TestContract {
    f: First;
    s: Second;
    t: Third;

    init() {
        self.f = First{ x: 1, y: 2 };
        self.s = Second{ a: self.f, b: 3 };
        self.t = Third{ s: self.s, z: true };
    }
}