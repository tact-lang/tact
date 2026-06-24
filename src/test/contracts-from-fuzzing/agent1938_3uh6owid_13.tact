struct DeepDefaults1 { a: Int = 1; }
struct DeepDefaults2 { b: DeepDefaults1 = DeepDefaults1{}; }
struct DeepDefaults3 { c: DeepDefaults2 = DeepDefaults2{}; }
contract DeepDefaultsTest {
    data: DeepDefaults3;

    init() {
        self.data = DeepDefaults3{};
    }
}