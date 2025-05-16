struct Encapsulate {
    s: Small;
}

struct Small {
    x: Int;
}

contract Wrapped {
    f: Encapsulate;

    init() {
        self.f = Encapsulate{ s: Small{x: 1} };
    }
}