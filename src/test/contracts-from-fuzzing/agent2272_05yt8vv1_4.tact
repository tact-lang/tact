struct NestedOptional {
    nestedOpt: OptType?;
}

struct OptType {
    x: Int;
}

contract NestedStructWithOptional {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ nestedOpt: null };
    }
}