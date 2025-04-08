struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOptional {
    inner: NestedOptional?;
}

contract TestContract {
    val: OuterOptional;

    init() {
        self.val = OuterOptional {
            inner: null,
        };
    }
}