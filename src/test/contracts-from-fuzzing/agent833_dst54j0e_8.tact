struct StringAndBool {
    s: String = "hello";
    b: Bool = true;
}

struct IntAndNested {
    i: Int = 42;
    sb: StringAndBool;
}

contract TestContract {
    value: IntAndNested;

    init() {
        self.value = IntAndNested{ i: 42, sb: StringAndBool{} };
    }
}
