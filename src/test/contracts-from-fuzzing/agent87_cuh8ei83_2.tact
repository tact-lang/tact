struct NestedOptional {
    val: Inner?;
}

struct Inner {
    a: Bool?;
    b: Int?;
}

contract Test {
    data: NestedOptional;

    init() {
        self.data = NestedOptional {
            val: Inner {
                a: null,
                b: null
            }
        };
    }
}
