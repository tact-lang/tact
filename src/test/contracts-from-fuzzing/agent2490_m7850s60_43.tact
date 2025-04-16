struct OptNested1 {
    s: String?;
}

struct OptNested2 {
    o1: OptNested1?;
    flag: Bool?;
}

contract OptNestedTest {
    data: OptNested2?;

    init() {
        self.data = null;
    }
}