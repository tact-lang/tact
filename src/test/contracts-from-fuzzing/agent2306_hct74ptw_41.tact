struct N { a: Int }
struct M { b: Int }

contract DuoStructs {
    x: N;
    y: M;

    init() {
        self.x = N{a:5};
        self.y = M{b:6};
    }
}
