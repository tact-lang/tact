struct DeeplyNested {
    inner1: Nested1;
}

struct Nested1 {
    inner2: Nested2;
}

struct Nested2 {
    val: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{ inner1: Nested1{ inner2: Nested2{ val: 42 } } };
    }
}