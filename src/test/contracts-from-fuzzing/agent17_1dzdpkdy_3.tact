struct First { a: Int; }
struct Second { b: Bool; c: Int; }
struct Third { nested: First; }
contract TestContract {
    x: First;
    y: Second;
    z: Third;

    init() {
        self.x = First{ a: 1 };
        self.y = Second{ b: true, c: 2 };
        self.z = Third{ nested: First{ a: 3 } };
    }
}