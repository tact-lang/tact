struct DeepDefaults1 {
    d: DeepDefaults2;
}

struct DeepDefaults2 {
    e: Int = 42;
    f: String = "yo";
}

contract NestedDefaultsTest {
    s: DeepDefaults1;

    init() {
        self.s = DeepDefaults1{ d: DeepDefaults2{} };
    }
}