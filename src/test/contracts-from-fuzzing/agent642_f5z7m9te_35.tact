// Edge: optional struct with nested struct with optionals and initialization
struct InnerMost {
    foo: Int?;
    bar: Bool?;
}

struct InnerOpt {
    nested: InnerMost?;
}

contract ComboTest {
    persist: InnerOpt?;

    init() {
        self.persist = null;
    }
}