struct DeepDefault {
    a: Int = 1;
    b: Int = 2;
    c: Nested;
}

struct Nested {
    x: Int = 9;
    y: Int = 10;
}

contract NestedDefaultsContract {
    f: DeepDefault;

    init() {
        self.f = DeepDefault{ c: Nested{} };
    }
}