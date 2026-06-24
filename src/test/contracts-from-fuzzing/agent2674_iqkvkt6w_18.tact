struct IntStringPair {
    num: Int;
    text: String;
}

struct Container {
    one: IntStringPair;
    two: IntStringPair;
    three: IntStringPair;
}

contract StructTupleTest {
    store: Container;

    init() {
        self.store = Container{
            one: IntStringPair{ num:1, text:"a" },
            two: IntStringPair{ num:2, text:"b" },
            three: IntStringPair{ num:3, text:"c" },
        };
    }
}