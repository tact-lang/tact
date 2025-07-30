struct Leaf1 {
    foo: Int;
}

struct Leaf2 {
    bar: String;
}

struct MiddleOpt {
    left: Leaf1?;
    right: Leaf2?;
}

contract NestedOptionalStructs {
    data: MiddleOpt;

    init() {
        self.data = MiddleOpt{
            left: null,
            right: null,
        };
    }
}