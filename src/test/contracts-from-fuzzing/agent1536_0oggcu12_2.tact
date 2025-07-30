struct Data1 {
    a: Int;
    b: Bool;
}

struct Data2 {
    p: Data1;
    q: Bool?;
}

contract DeepNestedTest {
    record: Data2;

    init() {
        self.record = Data2{ p: Data1{ a: 5, b: false }, q: true };
    }
}