struct C1 {
    a: Int?;
    b: Bool?;
}

struct C2 {
    c: C1?;
}

contract DeepOptionals {
    f: C2?;

    init() {
        self.f = null;
    }
}
