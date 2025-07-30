struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

struct Outer {
    inner: NestedDefaults;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer{ inner: NestedDefaults{} };
    }
}