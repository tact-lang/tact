struct Mid1 { a: Int; b: Bool; c: String; }
struct Mid2 { d: Int?; e: Bool?; f: String?; }

struct Container {
    m1: Mid1;
    m2: Mid2;
}

contract CompositeTest {
    cont: Container;

    init() {
        self.cont = Container{
            m1: Mid1{ a: 1, b: true, c: "x" },
            m2: Mid2{ d: null, e: null, f: null }
        };
    }
}