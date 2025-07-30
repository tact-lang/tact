struct InnerA { x: Int; }
struct InnerB { y: Bool; }

struct HasMultipleNestedStructs {
    a: InnerA;
    b: InnerB;
}

contract MultipleNestedTypes {
    data: HasMultipleNestedStructs;

    init() {
        self.data = HasMultipleNestedStructs{ a: InnerA{ x: 1 }, b: InnerB{ y: false } };
    }
}
