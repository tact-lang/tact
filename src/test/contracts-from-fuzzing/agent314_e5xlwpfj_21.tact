struct DefaultBool {
    flag: Bool = true;
}

struct DefaultInt {
    val: Int = 123;
}

contract TestContract {
    a: DefaultBool;
    b: DefaultInt;

    init() {
        self.a = DefaultBool{};
        self.b = DefaultInt{};
    }
}