struct Two {
    a: Int;
    b: Bool;
}

struct Container {
    x: Int;
    y: Bool;
    t: Two;
}

contract Test(c1: Container, c2: Container) {
}