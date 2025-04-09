struct S {
    a: Int? = null;
    b: Bool? = false;
    c: String = "default";
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            // omit all, defaults + nulls should apply
        };
    }
}
