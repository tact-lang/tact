struct NestBool {
    b: Bool;
}

struct OptionalNest {
    x: Int;
    nest: NestBool?;
}

contract NestedOptBool {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{ x: 12, nest: null };
    }
}