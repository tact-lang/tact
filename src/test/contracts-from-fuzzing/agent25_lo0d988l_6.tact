struct NestedOptionals {
    inner: InnerOpt?;
}

struct InnerOpt {
    nestedInt: Int?;
    nestedBool: Bool?;
    nestedString: String?;
}

contract TestContract {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            inner: null
        };
    }
}