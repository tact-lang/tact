struct Inner1 {
    a: Int;
    b: Bool?;
}

struct Inner2 {
    x: Int;
    y: String;
    z: Inner1;
}

contract Test {
    f: Inner2;
    init() {
        self.f = Inner2{ x: 2, y: "hi", z: Inner1{a: 1, b: null} };
    }
}