struct Nested1 { 
    x: Int;
}

struct Nested2 {
    nested1: Nested1;
    y: Bool;
}

contract TestContract {
    deeplyNested: Nested2;

    init() {
        self.deeplyNested = Nested2{ nested1: Nested1{ x: 5 }, y: false };
    }
}