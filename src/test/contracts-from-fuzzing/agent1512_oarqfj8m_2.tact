struct DeepNested { d1: Int; d2: Bool; }

struct Outer {
    o1: Int;
    o2: String;
    nested: DeepNested;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ o1: 10, o2: "hi", nested: DeepNested{ d1: 5, d2: false } };
    }
}