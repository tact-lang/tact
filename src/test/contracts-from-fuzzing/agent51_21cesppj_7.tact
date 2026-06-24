struct NestedDefault {
    x: Int = 5;
    y: Bool = true;
}

contract DefaultsTest {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: NestedDefault = NestedDefault{};

    init() {
        self.a = 42;
        self.b = true;
        self.c = "world";
        self.d = NestedDefault{ x: 7, y: false };
    }
}