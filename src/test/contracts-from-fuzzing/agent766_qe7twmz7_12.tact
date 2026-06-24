const DEF_INT: Int = 42;
const DEF_STR: String = "default";

struct SafeNested {
    a: Int = DEF_INT;
    b: Bool = true;
    c: String = DEF_STR;
}

contract ConstDefaultTest {
    x: SafeNested = SafeNested{};
    init() {
        self.x = SafeNested{ a: 100, b: false, c: "hello" };
    }
}