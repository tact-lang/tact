struct DeepNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    value: Int;
}

contract NestedStructStorage {
    val: DeepNested;

    init() {
        self.val = DeepNested{ inner1: Inner1{ inner2: Inner2{ value: 123 } } };
    }
}