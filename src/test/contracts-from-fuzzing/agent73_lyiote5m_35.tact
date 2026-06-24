struct NestedNullable {
    n1: Int?;
    n2: Int?;
    n3: Int?;
}

struct WrapperNullable {
    w: NestedNullable?;
}

contract Test {
    val: WrapperNullable;

    init() {
        self.val = WrapperNullable{ w: null };
    }
}