struct OptNested {
    i1: Int?;
    s1: String?;
    nested: DeepStr?;
}

struct DeepStr {
    b1: Bool;
    b2: Bool;
    str: String;
}

contract NestedOptionalsTest {
    complex: OptNested;
    init() {
        self.complex = OptNested{
            i1: null,
            s1: "Hi",
            nested: DeepStr{b1: true, b2: false, str: "Hello"}
        };
    }
}