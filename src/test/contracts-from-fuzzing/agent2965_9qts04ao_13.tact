struct RecDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: NestedWithDefaults;
}

struct NestedWithDefaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "bye";
}

contract TestContract {
    rec: RecDefault;

    init() {
        self.rec = RecDefault{d: NestedWithDefaults{}};
    }
}
