struct NestedDefault {
    inner: InnerD;
}

struct InnerD {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";
}

contract Test {
    val: NestedDefault;

    init() {
        self.val = NestedDefault{
            inner: InnerD{}
        };
    }
}