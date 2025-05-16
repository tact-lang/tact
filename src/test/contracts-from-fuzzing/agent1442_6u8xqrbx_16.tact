// fuzz nested struct with default values
struct Sub {
    a: Int = 42;
    b: Bool = true;
}

struct Parent {
    sub: Sub;
    c: String = "hi";
}

contract TestContract {
    p: Parent;
    init() {
        self.p = Parent{sub: Sub{}};
    }
}