// test optional nested structs, null parent + inner defaults
struct Parent {
    inner: Child?;
    count: Int;
}

struct Child {
    x: Int;
    y: String?;
}

contract Test {
    data: Parent?;

    init() {
        self.data = null;
    }
}